// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//
// バルーンキャラクター処理 [character_balloon.cpp]
// Author : KOKI NISHIYAMA
//
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#include "character_balloon.h"
#include "input.h"
#include "balloon_group.h"
#include "manager.h"
#include "collision.h"

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//
// マクロ定義
//
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#define CHARACTER_BALLOON_GRAVITY		(0.1f)			// キャラクターバルーンにかかる重力

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//
// 静的変数宣言
//
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// コンストラクタ処理
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CCharacter_Balloon::CCharacter_Balloon(CHARACTER const &character) : CCharacter::CCharacter(character)
{
	m_nCntState = 0;				// ステートカウント
}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// デストラクタ処理
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CCharacter_Balloon::~CCharacter_Balloon()
{
}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 初期化処理
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CCharacter_Balloon::Init(void)
{
	// キャラクター初期化
	CCharacter::Init();
	// ゲーム画面なら
	if (CManager::GetMode() == CManager::MODE_GAME)
	{
		// 変数宣言
		CCollision::OBJTYPE objtype = CCollision::OBJTYPE_PLAYER_BALLOON;
		// キャラクタータイプがNPCなら
		if (CCharacter::GetCharacter() == CCharacter::CHARACTER_NPC)
		{
			objtype = CCollision::OBJTYPE_ENEMY_BALLOON;
		}
		// 風船生成
		m_pBalloon_group = CBalloon_group::Create(
			&CCharacter::GetPos(),
			CCharacter::GetMatrix(-1),
			CCharacter::GetStatus(CCharacter::GetCharacter()).nMaxPopBalloon,
			objtype,

			this
		);
		// ステータスの反映 //
		// 初期風船を持っている個数
		m_pBalloon_group->SetBiginBalloon_group(
			CCharacter::GetStatus(CCharacter::GetCharacter()).nMaxPopBalloon
		);
	}
}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 終了処理
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CCharacter_Balloon::Uninit(void)
{
	CCharacter::Uninit();
	// 風船のヌルチェック
	// ->風船の開放
	if (m_pBalloon_group != NULL)
	{
		m_pBalloon_group = NULL;
	}
}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 更新処理
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CCharacter_Balloon::Update(void)
{
#ifdef _DEBUG
	if (CManager::GetKeyboard()->GetKeyboardTrigger(DIK_8))
	{
		// 雷に当たった時の挙動処理
		Thunder_BreakBalloon();
	}
#endif // _DEBUG

	// キャラクターの更新処理
	CCharacter::Update();
	// テスト
}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 描画処理
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CCharacter_Balloon::Draw(void)
{
	// キャラクター描画
	CCharacter::Draw();
}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 死亡処理
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CCharacter_Balloon::Die(void)
{
	// 死亡処理
	CCharacter::Die();
	// 風船のヌルチェック
	// ->風船の開放
	if (m_pBalloon_group != NULL)
	{
		m_pBalloon_group->Release();
		m_pBalloon_group = NULL;
	}
}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 当たった後の処理
//	nObjType	: オブジェクトタイプ
//	pScene		: 相手のシーン情報
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CCharacter_Balloon::Scene_MyCollision(int const & nObjType, CScene * pScene)
{
	// キャラクターの当たった後の処理
	CCharacter::Scene_MyCollision(nObjType, pScene);
	// シーン情報がNULLなら
	// ->関数を抜ける
	if (pScene == NULL) return;
	// オブジェクトタイプがキャラクターなら
	else if (nObjType == CCollision::OBJTYPE_PLAYER)
	{
		// 変数宣言
		D3DXVECTOR3 RefVecA;
		D3DXVECTOR3 RefVecB;
		D3DXVECTOR3 *pCharacterPos = pScene->Scene_GetPPos();
		D3DXVECTOR3 *pCharacterMove = pScene->Scene_GetPMove();
		// 押し出し処理を入れる
		// 今回の当たり判定とプレイヤーの位置ポインター管理
		// 衝突後の速度計算処理
		CCalculation::SquarColiAfterVec(
			m_pos,
			m_move,
			*pCharacterPos,
			*pCharacterMove,
			1,
			1,
			1.0f,
			1.0f,
			RefVecA,
			RefVecB
		);
		m_move = D3DVECTOR3_ZERO;
		*pCharacterMove = D3DVECTOR3_ZERO;
		m_move += RefVecA * 10.0f;
		*pCharacterMove += RefVecB * 5.0f;
	}
	// オブジェクトタイプがプレイヤー風船なら ||
	// オブジェクトタイプが敵風船なら ||
	else if (nObjType == CCollision::OBJTYPE_PLAYER_BALLOON ||
		nObjType == CCollision::OBJTYPE_ENEMY_BALLOON)
	{
		// 変数宣言
		D3DXVECTOR3 RefVecA;
		D3DXVECTOR3 RefVecB;
		D3DXVECTOR3 *pCharacterPos = pScene->Scene_GetPPos();
		D3DXVECTOR3 CharacterMove = D3DVECTOR3_ZERO;
		// 押し出し処理を入れる
		// 今回の当たり判定とプレイヤーの位置ポインター管理
		// 衝突後の速度計算処理
		CCalculation::SquarColiAfterVec(
			m_pos,
			m_move,
			*pCharacterPos,
			CharacterMove,
			1,
			1,
			1.0f,
			1.0f,
			RefVecA,
			RefVecB
		);
		m_move = D3DVECTOR3_ZERO;
		m_move += RefVecA* 10.0f;
	}
}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 相手に当てられた後の処理
//	nObjType	: オブジェクトタイプ
//	pScene		: 相手のシーン情報
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CCharacter_Balloon::Scene_OpponentCollision(int const & nObjType, CScene * pScene)
{
	CCharacter::Scene_OpponentCollision(nObjType, pScene);
	// シーン情報がNULLなら
	// ->関数を抜ける
	if (pScene == NULL) return;
	// オブジェクトタイプがプレイヤーなら
	else if (nObjType == CCollision::OBJTYPE_PLAYER)
	{
	}
	// オブジェクトタイプがプレイヤー風船なら ||
	// オブジェクトタイプが敵風船なら ||
	else if (nObjType == CCollision::OBJTYPE_PLAYER_BALLOON ||
		nObjType == CCollision::OBJTYPE_ENEMY_BALLOON)
	{

	}
}

#ifdef _DEBUG
//-------------------------------------------------------------------------------------------------------------
// デバッグ表示
//-------------------------------------------------------------------------------------------------------------
void CCharacter_Balloon::Debug(void)
{
	// キャラクターデバッグ
	CCharacter::Debug();
}
#endif // _DEBUG

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 風船がない場合
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
bool CCharacter_Balloon::BalloonNone(void)
{
	// 風船の情報がNULLなら
	// ->関数を抜ける
	if (m_pBalloon_group == NULL)
	{
		// falseを返す
		return false;
	}
	// 出現している風船の数が0の場合
	// ->キャラクター死亡
	if (m_pBalloon_group->GetPopBalloon_group() == 0)
	{
		// 死亡処理
		Die();
		// trueを返す
		return true;
	}
	// falseを返す
	return false;
}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 風船を生成する処理
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CCharacter_Balloon::BalloonCreate(void)
{
	// 所持している風船が0超過なら
	// ->風船を生成する処理
	if (m_pBalloon_group->GetBringBalloon_group() > 0)
	{
		// 変数宣言
		CCollision::OBJTYPE objtype = CCollision::OBJTYPE_PLAYER_BALLOON;
		// キャラクタータイプがNPCなら
		if (CCharacter::GetCharacter() == CCharacter::CHARACTER_NPC)
		{
			objtype = CCollision::OBJTYPE_ENEMY_BALLOON;
		}
		m_pBalloon_group->CreateBalloon_group(
			objtype,
			this);
	}
}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 風船を強制的に割らせる処理
// nBreakBalloon:割れる風船の個数
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CCharacter_Balloon::Thunder_BreakBalloon(void)
{
	m_pBalloon_group->Thunder_BreakBalloon_group();
}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// リソース情報読み込み処理
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
HRESULT CCharacter_Balloon::Load(void)
{
	return S_OK;
}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 読み込んだリソース情報を破棄処理
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CCharacter_Balloon::UnLoad(void)
{
}
