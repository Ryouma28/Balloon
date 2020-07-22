// ==========================================================
//
// プレイヤー(透明)処理 [invisible.cpp]
// Author : RYOUMA INOUE
//
// ==========================================================
#include "invisible.h"
#include "manager.h"

// ==========================================================
//
// マクロ定義
//
// ==========================================================
#define INVISIBLE_FRONTFORCE (10)
#define INVISIBLE_G (0.5f)			// 重力
#define INVISIBLE_RESISTANCE (0.5f)// 抵抗力

// ==========================================================
//
// 静的変数宣言
//
// ==========================================================

// ==========================================================
// コンストラクタ処理
// ==========================================================
CInvisible::CInvisible() : CPlayer::CPlayer(CHARACTER_BALLOON3)
{
}

// ==========================================================
// デストラクタ処理
// ==========================================================
CInvisible::~CInvisible()
{
}

// ==========================================================
// 初期化処理
// ==========================================================
void CInvisible::Init(void)
{
	CPlayer::Init();

	// 状態の初期化
	m_bInvisible = false;
}

// ==========================================================
// 終了処理
// ==========================================================
void CInvisible::Uninit(void)
{
	CPlayer::Uninit();
}

// ==========================================================
// 更新処理
// ==========================================================
void CInvisible::Update(void)
{
	CPlayer::Update();

	// ゲームへ遷移
	if (CManager::GetKeyboard()->GetKeyboardPress(DIK_I))
	{
		// 状態変化
		m_bInvisible = true;
	}
	else if (CManager::GetKeyboard()->GetKeyboardPress(DIK_O))
	{
		// 状態変化
		m_bInvisible = false;
	}
}

// ==========================================================
// 描画処理
// ==========================================================
void CInvisible::Draw(void)
{
	if (m_bInvisible == false)
	{
		CPlayer::Draw();
	}
}

// ==========================================================
// 死んだときの処理
// ==========================================================
void CInvisible::Die(void)
{
	CPlayer::Die();
}

#ifdef _DEBUG
// ==========================================================
// デバッグ表示
// ==========================================================
void CInvisible::Debug(void)
{
	CPlayer::Debug();
}
#endif // _DEBUG

// ==========================================================
// 当たった後の処理
//	nObjType	: オブジェクトタイプ
//	pScene		: 相手のシーン情報
// ==========================================================
void CInvisible::Scene_MyCollision(int const & nObjType, CScene * pScene)
{
	CPlayer::Scene_MyCollision(nObjType, pScene);
}

// ==========================================================
// 相手に当てられた後の処理
//	nObjType	: オブジェクトタイプ
//	pScene		: 相手のシーン情報
// ==========================================================
void CInvisible::Scene_OpponentCollision(int const & nObjType, CScene * pScene)
{
	CPlayer::Scene_OpponentCollision(nObjType, pScene);
}

// ==========================================================
// 生成処理(シーン管理)
// ==========================================================
CInvisible * CInvisible::Create(
	int const &nPlayerID,
	D3DXVECTOR3 const & pos,
	D3DXVECTOR3 const & rot
)
{
	// 変数宣言
	CInvisible * pInvisible;
	// メモリの生成(初め->基本クラス,後->派生クラス)
	pInvisible = new CInvisible();
	// シーン管理設定
	pInvisible->ManageSetting(CScene::LAYER_CHARACTER);
	// 設定
	pInvisible->SetPlayerID(nPlayerID);
	pInvisible->SetPos(pos);
	pInvisible->SetRot(rot);
	pInvisible->SetRotDest(rot);
	// 初期化処理
	pInvisible->Init();
	// 生成したオブジェクトを返す
	return pInvisible;
}

// ==========================================================
// 生成処理(個人管理)
// ==========================================================
CInvisible * CInvisible::Create_Self(
	int const &nPlayerID,
	D3DXVECTOR3 const & pos,
	D3DXVECTOR3 const & rot
)
{
	// 変数宣言
	CInvisible * pInvisible;
	// メモリの生成(初め->基本クラス,後->派生クラス)
	pInvisible = new CInvisible();
	// 設定
	pInvisible->SetPlayerID(nPlayerID);
	pInvisible->SetPos(pos);
	pInvisible->SetRot(rot);
	pInvisible->SetRotDest(rot);
	// 初期化処理
	pInvisible->Init();
	// 生成したオブジェクトを返す
	return pInvisible;
}

// ==========================================================
// リソース情報読み込み処理
// ==========================================================
HRESULT CInvisible::Load(void)
{
	return S_OK;
}

// ==========================================================
// 読み込んだリソース情報を破棄処理
// ==========================================================
void CInvisible::UnLoad(void)
{

}