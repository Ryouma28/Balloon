// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//
// Xシーン処理の説明[scene_X.cpp]
// Author : Koki Nishiyama
//
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//
// インクルードファイル
//
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#include "scene_X.h"
#include "manager.h"
#include "debugproc.h"
#include "selectcharacter.h"
#include "floor.h"
#include "shadow_mapping.h"
#include "collision.h"
#include "Extrusion.h"
#include "scene_three.h"
#include "3Dparticle.h"
#include "camera.h"
#include "spherecollision.h"
#include "rectcollision.h"
#include "columncollision.h"

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//
// マクロ定義
//
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#define TEXTURE_FILE "data/LOAD/MODEL/model_manager.csv"

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//
// 静的変数宣言
//
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
std::vector<std::unique_ptr<CScene_X::MODEL_LOAD>>  CScene_X::m_pModelLoad;	// プレイヤー(雷)情報の読み込み用

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// イニシャライザコンストラクタ
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CScene_X::CScene_X() : CScene::CScene()
{
	m_pos = D3DVECTOR3_ZERO;	// 位置情報
	m_rot = D3DVECTOR3_ZERO;	// 回転情報
	m_nModelId = 0;				// プレイヤー(雷)番号
	m_fShadowAlpha = 1.0f;		// 影のα値
	m_fModelAlpha = 1.0f;		// プレイヤーのα値
	m_bShadowMap = false;		// シャドウマッピングにするかしないか
	m_pExtrusion = NULL;		// 当たり判定
	m_pParentMtx = NULL;		// 親マトリックス
	m_pShadow = NULL;			// シャドウ
	m_Collision = NULL;			// 当たり判定
	m_pModelCol = NULL;			// モデルカラー情報
	// ワールドマトリックスの初期化
	D3DXMatrixIdentity(&m_mtxWorld);
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// デストラクタ処理
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CScene_X::~CScene_X()
{
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 初期化処理
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CScene_X::Init(void)
{
	/*
	if (!m_bShadowMap)
	{
		// 長さを計算
		float fLength = CCalculation::DiffPointSquare(
			D3DXVECTOR2(0.0f, 0.0f),
			D3DXVECTOR2(m_pModelLoad[m_nModelId]->size.x, m_pModelLoad[m_nModelId]->size.z));
		// 影を生成
		m_pShadow = std::move(CScene_THREE::Create_Uni(
			CScene_THREE::OFFSET_TYPE_VERTICAL_CENTER,
			m_pos,
			D3DXVECTOR3(fLength, 0.0f, fLength),
			1,
			D3DVECTOR3_ZERO,
			false,
			false,
			false,
			false,
			D3DXCOLOR(0.0f, 0.0f, 0.0f, m_fShadowAlpha)
		));
	}
	*/
	// 行列の初期化処理
	D3DXMatrixIdentity(&m_mtxWorld);
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 終了処理
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CScene_X::Uninit(void)
{
	// まる影がNULLではないなら
	// ->開放
	if (m_pShadow != NULL)
	{
		m_pShadow->Release();
		m_pShadow = NULL;
	}
	// 当たり判定の開放
	if (m_pExtrusion != NULL)
	{
		m_pExtrusion->Release();
		m_pExtrusion = NULL;
	}
	// 当たり判定情報の開放
	if (m_Collision != NULL)
	{
		m_Collision->CompulsionScene();
		m_Collision->Release();
		m_Collision = NULL;
	}
	// モデルカラー情報がNULLなら
	if (m_pModelCol != NULL)
	{
		// モデルカラー情報のメモリ確保
		delete m_pModelCol;
		m_pModelCol = NULL;
	}
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 更新処理
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CScene_X::Update(void)
{
	// まる影がNULLではないなら
	// ->更新
	if (m_pShadow != NULL)
	{
		m_pShadow->SetPos(D3DXVECTOR3(m_pos.x,0.1f,m_pos.z));
		m_pShadow->SetCol(D3DXCOLOR(0.0f, 0.0f, 0.0f, m_fShadowAlpha));
	}
	// 当たり判定がNULLではないなら
	// 更新
	if (m_Collision != NULL)
	{
		// 位置情報の更新(行列渡し)
		m_Collision->GetShape()->PassMatrix(m_mtxWorld);
		// 更新
		m_Collision->Update();
		return;
	}
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 描画処理
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CScene_X::Draw(void)
{
	// 変数宣言
	LPDIRECT3DDEVICE9	pDevice = CManager::GetRenderer()->GetDevice();

	D3DXMATRIX			mtxRot, mtxTrans;		// 計算用マトリックス
	D3DXMATERIAL		*pMat;					// 現在のマテリアル保存
	D3DMATERIAL9		matDef;					// マテリアルデータのポインタ

	// ワールドマトリックスの初期化
	D3DXMatrixIdentity(&m_mtxWorld);

	// 回転を反映
	// スケールを反映
	D3DXMatrixRotationYawPitchRoll(&mtxRot,
		m_rot.y,
		m_rot.x,
		m_rot.z);

	// 行列の積(1:ワールド行列 = 2:ワールド行列 * 3:回転行列)
	D3DXMatrixMultiply(&m_mtxWorld,
		&m_mtxWorld, &mtxRot);


	// 位置を反映 //
	// 平行移動行列作成(オフセット)
	D3DXMatrixTranslation(&mtxTrans,							// 総合の入れ物
		m_pos.x,
		m_pos.y,
		m_pos.z);

	// 行列の積(1:ワールド行列 = 2:ワールド行列 * 3:移動行列)
	D3DXMatrixMultiply(&m_mtxWorld,	// 1
		&m_mtxWorld,				// 2
		&mtxTrans);					// 3
	// 親情報を持っているとき
	// ->自分のマトリックス情報 * 親のマトリックス情報
	if (m_pParentMtx != NULL)
	{
		// 親と子の行列の積(1:ワールド行列 = 2:ワールド行列 * 3:体[親]行列)
		D3DXMatrixMultiply(&m_mtxWorld,
			&m_mtxWorld,
			m_pParentMtx);
	}
	// シャドウマッピングがオンなら
	if (m_bShadowMap)
	{
		// ステンシルバッファを有効にする
		pDevice->SetRenderState(D3DRS_STENCILREF, 1);
		pDevice->SetRenderState(D3DRS_STENCILENABLE, true);
		// ステンシル対象を設定
		pDevice->SetRenderState(D3DRS_STENCILFUNC, D3DCMP_NOTEQUAL);
		// ステンシルテスト、Zテスト両方とも合格の場合の判定
		pDevice->SetRenderState(D3DRS_STENCILPASS, D3DSTENCILOP_REPLACE);
		// ステンシルテスト合格、Zテスト不合格の場合の判定
		pDevice->SetRenderState(D3DRS_STENCILZFAIL, D3DSTENCILOP_KEEP);
		// ステンシルテスト不合格、Zテスト不合格の場合の判定
		pDevice->SetRenderState(D3DRS_STENCILFAIL, D3DSTENCILOP_KEEP);
		// シャドウマッピング
		CShadowmapping::Draw(
			pDevice,	// デバイス情報
			m_pModelLoad[m_nModelId].get(),	// プレイヤー(雷)情報
			m_mtxWorld	// マトリックス情報
		);
		// ステンシルバッファを有効にする
		pDevice->SetRenderState(D3DRS_STENCILENABLE, false);
	}
	// ワールドマトリックスの設定
	pDevice->SetTransform(D3DTS_WORLD, &m_mtxWorld);

	// 現在のマテリアルを取得
	pDevice->GetMaterial(&matDef);

	// マテリアル情報に対するポインタを取得
	pMat = (D3DXMATERIAL*)m_pModelLoad[m_nModelId]->pBuffMat->GetBufferPointer();
	// カウントマテリアル
	for (int nCntMat = 0; nCntMat < (int)m_pModelLoad[m_nModelId]->nNumMat; nCntMat++, pMat++)
	{
		// モデルカラー情報のNULLチェック
		if (m_pModelCol != NULL)
		{
			// モデルカラーの設定
			pMat->MatD3D.Diffuse = *m_pModelCol;
		}
		// プレイヤー(雷)の透明度
		pMat->MatD3D.Diffuse.a = m_fModelAlpha;

		// マテリアルの設定
		pDevice->SetMaterial(&pMat->MatD3D);

		// テクスチャー設定
		pDevice->SetTexture(0, m_pModelLoad[m_nModelId]->vec_pTexture[nCntMat]);

		// 描画
		m_pModelLoad[m_nModelId]->pMesh->DrawSubset(nCntMat);
	}

	// マテリアルをデフォルトに戻す
	pDevice->SetMaterial(&matDef);
}

#ifdef _DEBUG
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// デバッグ表示
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CScene_X::Debug(void)
{
}
#endif // _DEBUG

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// あたり判定を強制的に削除
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CScene_X::CollisionDelete(void)
{
	// 当たり判定情報の開放
	if (m_Collision != NULL)
	{
		m_Collision->CompulsionScene();
		m_Collision->Release();
		m_Collision = NULL;
	}
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 作成処理(シーン管理)
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CScene_X * CScene_X::Create(
	D3DXVECTOR3 const & pos,
	D3DXVECTOR3 const & rot,
	int const & nModelId,
	bool const & bShadowMap
)
{
	// 変数宣言
	CScene_X * pScene_X;		// シーン3Dクラス
	// メモリの生成(初め->基本クラス,後->派生クラス)
	pScene_X = new CScene_X();
	// シーン管理設定
	pScene_X->ManageSetting(CScene::LAYER_3DOBJECT);
	// 設定
	pScene_X->m_pos = pos;
	pScene_X->m_rot = rot;
	pScene_X->m_nModelId = nModelId;
	pScene_X->m_bShadowMap = bShadowMap;
	// 初期化処理
	pScene_X->Init();

	// 生成したオブジェクトを返す
	return pScene_X;
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 作成処理(個人管理)
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CScene_X * CScene_X::Create_Self(
	D3DXVECTOR3 const & pos,
	D3DXVECTOR3 const & rot,
	int const & nModelId,
	bool const & bShadowMap
)
{
	// 変数宣言
	CScene_X * pScene_X;		// シーンXクラス
	// メモリの生成(初め->基本クラス,後->派生クラス)
	pScene_X = new CScene_X();
	// 設定
	pScene_X->m_pos = pos;
	pScene_X->m_rot = rot;
	pScene_X->m_nModelId = nModelId;
	pScene_X->m_bShadowMap = bShadowMap;
	// 初期化処理
	pScene_X->Init();
	// 生成したオブジェクトを返す
	return pScene_X;
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 作成処理(個人管理)
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
std::unique_ptr<CScene_X> CScene_X::Create_Uni(
	D3DXVECTOR3 const & pos,
	D3DXVECTOR3 const & rot,
	int const & nModelId,
	bool const & bShadowMap
)
{
	// 変数宣言
	std::unique_ptr<CScene_X> pScene_X(new CScene_X);		// シーンXクラス
	// 設定
	pScene_X->m_pos = pos;
	pScene_X->m_rot = rot;
	pScene_X->m_nModelId = nModelId;
	pScene_X->m_bShadowMap = bShadowMap;
	// 初期化処理
	pScene_X->Init();
	// 生成したオブジェクトを返す
	return pScene_X;
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// プレイヤー(雷)情報の読み込み処理
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
HRESULT CScene_X::LoadModel(void)
{
	// 変数宣言
	LPDIRECT3DDEVICE9 pDevice =					// デバイスの取得
		CManager::GetRenderer()->GetDevice();
	std::vector<std::vector<std::string>> vsvec_Contens;		// テキストデータ格納用
	// ファイルの中身を取得する
	vsvec_Contens = CCalculation::FileContens(TEXTURE_FILE, ',');
	// 行ごとに回す
	for (int nCntLine = 0; nCntLine < (signed)vsvec_Contens.size(); nCntLine++)
	{
		// 項目ごとに回す
		for (int nCntItem = 0; nCntItem < (signed)vsvec_Contens.at(nCntLine).size(); nCntItem++)
		{
			// 変数宣言
			std::unique_ptr<MODEL_LOAD> pModelLoad(new MODEL_LOAD);	// プレイヤー(雷)情報の読み込み用
			switch (nCntItem)
			{
				// パス情報
			case 0:
				// Xファイルの読み込み
				if (!D3DXLoadMeshFromX(
					vsvec_Contens[nCntLine][nCntItem].c_str(),
					D3DXMESH_SYSTEMMEM,
					pDevice,
					NULL,
					&pModelLoad->pBuffMat,
					NULL,
					&pModelLoad->nNumMat,
					&pModelLoad->pMesh) == S_OK
					)
				{
					std::string sNum = std::to_string(nCntLine);
					CCalculation::Messanger(sNum.c_str());
				}
				// プレイヤー(雷)情報の設定
				ModelSetting(pModelLoad.get());
				// プレイヤー(雷)情報の格納
				m_pModelLoad.push_back(std::move(pModelLoad));
				break;
			default:
				break;
			}
			// モデル読み込み変数の初期化
			pModelLoad.reset();
		}
	}
	return S_OK;
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// プレイヤー(雷)情報の開放処理
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
HRESULT CScene_X::UnLoadModel(void)
{
	// プレイヤー(雷)情報の開放
	for (int nCntModel = 0; nCntModel < (signed)m_pModelLoad.size(); nCntModel++)
	{
		// メッシュの開放
		if (m_pModelLoad[nCntModel]->pMesh != NULL)
		{
			m_pModelLoad[nCntModel]->pMesh->Release();
			m_pModelLoad[nCntModel]->pMesh = NULL;
		}

		// マテリアルの開放
		if (m_pModelLoad[nCntModel]->pBuffMat != NULL)
		{
			m_pModelLoad[nCntModel]->pBuffMat->Release();
			m_pModelLoad[nCntModel]->pBuffMat = NULL;
		}

		// テクスチャーの開放
		for (int nCntTex = 0; nCntTex < (signed)m_pModelLoad[nCntModel]->vec_pTexture.size(); nCntTex++)
		{
			if (m_pModelLoad[nCntModel]->vec_pTexture[nCntTex] != NULL)
			{
				m_pModelLoad[nCntModel]->vec_pTexture[nCntTex]->Release();
				m_pModelLoad[nCntModel]->vec_pTexture[nCntTex] = NULL;
			}
			m_pModelLoad[nCntModel]->vec_pTexture.clear();
			m_pModelLoad[nCntModel]->vec_pTexture.shrink_to_fit();
		}
		// モデル読み込み変数の初期化
		m_pModelLoad[nCntModel].reset();
	}
	m_pModelLoad.clear();
	m_pModelLoad.shrink_to_fit();
	return S_OK;
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// プレイヤー(雷)設定処理
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CScene_X::ModelSetting(MODEL_LOAD * pModel_load)
{
	// 変数宣言
	LPDIRECT3DDEVICE9 pDevice;		// デバイス
	D3DXMATERIAL *pMat;				// 現在のマテリアル保存
	int nNumVertex;					// 頂点数
	DWORD sizeFVF;					// 頂点フォーマットのサイズ
	BYTE *pVertexBuffer;			// 頂点バッファへのポインタ
	// デバイスの取得
	pDevice = CManager::GetRenderer()->GetDevice();
	// マテリアルの頂点位置の最大値・最小値
	pModel_load->vtxMinMaterials = D3DXVECTOR3(1000.0f, 1000.0f, 1000.0f);
	pModel_load->vtxMaxMaterials = D3DXVECTOR3(-1000.0f, -1000.0f, -1000.0f);
	// 頂点数を取得
	nNumVertex = pModel_load->pMesh->GetNumVertices();
	// 頂点フォーマットのサイズを取得
	sizeFVF = D3DXGetFVFVertexSize(pModel_load->pMesh->GetFVF());
	// マテリアル情報に対するポインタを取得
	pMat = (D3DXMATERIAL*)pModel_load->pBuffMat->GetBufferPointer();
	// マテリアル情報を取得
	for (int nCntMat = 0; nCntMat < (int)pModel_load->nNumMat; nCntMat++, pMat++)
	{
		LPDIRECT3DTEXTURE9 pTexture = NULL;
		D3DXCreateTextureFromFile(pDevice, pMat->pTextureFilename, &pTexture);
		pModel_load->vec_pTexture.push_back(std::move(pTexture));
	}

	// 頂点バッファをロック
	pModel_load->pMesh->LockVertexBuffer(D3DLOCK_READONLY, (void**)&pVertexBuffer);
	// 頂点数分繰り返す
	for (int nCntVtx = 0; nCntVtx < nNumVertex; nCntVtx++)
	{
		// 番地情報のD3DXVE
		D3DXVECTOR3 vtx = *(D3DXVECTOR3*)pVertexBuffer;

		// -----------すべての頂点情報を比較して最小値・最大値を抜き出す---------- //
		// x //
		// 最小値
		if (pModel_load->vtxMinMaterials.x > vtx.x)
		{
			pModel_load->vtxMinMaterials.x = vtx.x;
		}
		// 最大値
		if (pModel_load->vtxMaxMaterials.x < vtx.x)
		{
			pModel_load->vtxMaxMaterials.x = vtx.x;
		}
		// y //
		// 最小値
		if (pModel_load->vtxMinMaterials.y > vtx.y)
		{
			pModel_load->vtxMinMaterials.y = vtx.y;
		}
		// 最大値
		if (pModel_load->vtxMaxMaterials.y < vtx.y)
		{
			pModel_load->vtxMaxMaterials.y = vtx.y;
		}
		// z //
		// 最小値
		if (pModel_load->vtxMinMaterials.z > vtx.z)
		{
			pModel_load->vtxMinMaterials.z = vtx.z;
		}
		// 最大値
		if (pModel_load->vtxMaxMaterials.z < vtx.z)
		{
			pModel_load->vtxMaxMaterials.z = vtx.z;
		}
		// サイズポインタを進める
		pVertexBuffer += sizeFVF;
	}
	// アンロック
	pModel_load->pMesh->UnlockVertexBuffer();
	// サイズ
	pModel_load->size = pModel_load->vtxMaxMaterials - pModel_load->vtxMinMaterials;
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 当たり判定処理
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CScene_X::SetCollision(void)
{
	// 当たり判定生成
	m_pExtrusion = CExtrusion::Create(
		&m_pos,
		50.0f
	);
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 当たり判定設定
// 0:矩形、1:球、2:円柱
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CScene_X::SetCollision(
	int const & nShapeType,
	int const &obj,
	bool const &bPush,
	bool const &bOpponent,
	CScene * pParent,
	D3DXVECTOR3 const &offset_pos
)
{
	// 当たり判定がNULLではないなら
	// ->関数を抜ける
	if (m_Collision != NULL)
	{
#ifdef _DEBUG
		CCalculation::Messanger("CScene_X::SetCollisionの中->既にあたり判定のデータが入っています");
#endif // _DEBUG
		return;
	}
	// 形のタイプ
	switch (nShapeType)
	{
		// 矩形
	case CShape::SHAPETYPE_RECT:
		// 矩形の当たり判定生成
		m_Collision = CRectCollision::Create(
			m_pModelLoad[m_nModelId]->size,
			offset_pos,
			(CCollision::OBJTYPE)obj,
			this,
			pParent,
			bPush,
			bOpponent
		);
		// 位置情報の更新(行列渡し)
		m_Collision->GetShape()->PassMatrix(m_mtxWorld);
		break;
		// 球
	case CShape::SHAPETYPE_SPHERE:
		// 球の当たり判定生成
		m_Collision = CSphereCollision::Create(
			m_pModelLoad[m_nModelId]->size.x,
			offset_pos,
			(CCollision::OBJTYPE)obj,
			this,
			pParent,
			bPush,
			bOpponent
		);
		// 位置情報の更新(行列渡し)
		m_Collision->GetShape()->PassMatrix(m_mtxWorld);
		break;
		// 円柱
	case CShape::SHAPETYPE_COLUMN:
		// 球の当たり判定生成
		m_Collision = CColumnCollision::Create(
			m_pModelLoad[m_nModelId]->size.x,
			m_pModelLoad[m_nModelId]->size.y,
			offset_pos,
			(CCollision::OBJTYPE)obj,
			this,
			pParent,
			bPush,
			bOpponent
		);
		// 位置情報の更新(行列渡し)
		m_Collision->GetShape()->PassMatrix(m_mtxWorld);
		break;
	default:
		break;
	}
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// モデルカラー情報の設定
//	col	: カラー
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CScene_X::SetModelColor(
	D3DXCOLOR const &col
)
{
	// モデルカラー情報がNULLなら
	if (m_pModelCol == NULL)
	{
		// モデルカラー情報のメモリ確保
		m_pModelCol = new D3DXCOLOR;
	}
	// カラーの代入
	*m_pModelCol = col;
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Xプレイヤー(雷)取得処理
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CScene_X::MODEL_LOAD * CScene_X::GetModel(int const &nModelId)
{
	return m_pModelLoad[nModelId].get();
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 当たり判定状態取得処理
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
bool const CScene_X::GetbCollision(void)
{
	// 当たり判定情報がNULLなら
	// ->関数を抜ける
	if (m_Collision == NULL) return false;
	return m_Collision->GetbCollision();
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 当たり判定情報取得処理
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CCollision * CScene_X::GetCollision(void)
{
	return m_Collision;
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// プレイヤー(雷)情報取得処理
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CScene_X::MODEL_LOAD * CScene_X::GetModelLoad(int const & nModelId)
{
	// プレイヤー(雷)番号がサイズ以上なら
	// ->関数を抜ける
	if ((signed)m_pModelLoad.size() >= nModelId)
	{
		return m_pModelLoad[0].get();
	}
	return m_pModelLoad[nModelId].get();
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// スクリプトを読み込む
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CScene_X::LoadScrept(char* add)
{
	FILE *pFile = NULL;											// ファイル
	char cReadText[128] = {};									// 文字
	char cHeadText[128] = {};									// 比較
	CScene_X *pObject = NULL;

	pFile = fopen(add, "r");									// ファイルを開くまたは作る

	if (pFile != NULL)											// ファイルが読み込めた場合
	{
		fgets(cReadText, sizeof(cReadText), pFile);				// 行を飛ばす
		fgets(cReadText, sizeof(cReadText), pFile);				// 行を飛ばす
		fgets(cReadText, sizeof(cReadText), pFile);				// 行を飛ばす

		while (strcmp(cHeadText, "End") != 0)
		{
			std::string Data = cReadText;
			std::vector<std::string> splitData = CCalculation::split(Data, ',');

			pObject = CScene_X::Create(D3DXVECTOR3((float)atof(splitData[LOADTYPE_POS_X].c_str()), (float)atof(splitData[LOADTYPE_POS_Y].c_str()), (float)atof(splitData[LOADTYPE_POS_Z].c_str())),
									D3DXVECTOR3((float)atof(splitData[LOADTYPE_ROT_X].c_str()), (float)atof(splitData[LOADTYPE_ROT_Y].c_str()), (float)atof(splitData[LOADTYPE_ROT_Z].c_str())),
									atoi(splitData[LOADTYPE_ADD].c_str()));

			fgets(cReadText, sizeof(cReadText), pFile);									// 行を飛ばす
			sscanf(cReadText, "%s", &cHeadText);
		}

		fclose(pFile);					// ファイルを閉じる
	}
	else
	{
		MessageBox(NULL, "モデル情報のアクセス失敗！", "WARNING", MB_ICONWARNING);	// メッセージボックスの生成
	}
}