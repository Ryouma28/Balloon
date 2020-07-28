// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//
// 敵処理 [enemy.cpp]
// Author : KOKI NISHIYAMA
//
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#include "enemy.h"
#include "player.h"
#include "3Dparticle.h"
#include "game.h"
#include "circleshadow.h"
#include "camera.h"
#include "balloon_group.h"

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//
// マクロ定義
//
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#define ENEMY_KEYMOVE (1)
#define ENEMY_G (0.5f)			// 重力
#define ENEMY_RESISTANCE (0.5f)// 抵抗力

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//
// 静的変数宣言
//
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// オーバーロードコンストラクタ(子供用)
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CEnemy::CEnemy(CHARACTER const &character) : CCharacter_Balloon::CCharacter_Balloon(character)
{
}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// デストラクタ処理
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CEnemy::~CEnemy()
{
}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 初期化処理
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CEnemy::Init(void)
{
	// キャラクター初期化
	CCharacter_Balloon::Init();
}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 終了処理
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CEnemy::Uninit(void)
{
	// キャラクター終了処理
	CCharacter_Balloon::Uninit();
}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 更新処理
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CEnemy::Update(void)
{
	// AIアクション処理
	Ai_Action();

	// キャラクター更新処理
	CCharacter_Balloon::Update();
}


// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// AIアクション処理
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CEnemy::Ai_Action(void)
{
	// 出現している風船がすべて割られていたら
	if (CCharacter_Balloon::GetBalloon()->GetPopBalloon_group() <= 0)
	{
		m_AI = AIACTION_BALLOON_NONE;
	}
	// 位置yが500超過なら
	else if (CCharacter::GetPos().y > 500.0f)
	{
		m_AI = AIACTION_STAND;
	}
	// 位置yが10未満なら
	else if (CCharacter::GetPos().y < 10.0f)
	{
		m_AI = AIACTION_JUMP;
	}

	switch (m_AI)
	{
		// 立っている状態(何もしていない)
	case AIACTION_STAND:
		break;
		// ジャンプ状態
	case AIACTION_JUMP:
		// AI行動_ジャンプ処理
		AiAction_Jump();
		break;
		// 出現している風船がすべて割られている状態
	case AIACTION_BALLOON_NONE:
		break;
	default:
		break;
	}
	// AI移動処理
	//Ai_Move();
	// 風船を膨らませる
	if (CManager::GetJoy() != NULL)
	{
		if (CManager::GetJoy()->GetTrigger(0, CJoypad::KEY_B))
		{
			// 風船を生成する処理
			CCharacter_Balloon::BalloonCreate();
		}
	}
}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// AI移動処理
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CEnemy::Ai_Move(void)
{
	// 変数宣言
	D3DXVECTOR3 move, rot;			// 移動量、回転
	bool bMove = false;				// 移動状態
	float fRot;						// 回転

	// 情報取得
	rot = CCharacter::GetRotDest();								// 目的回転量
	move = CCharacter::GetMove();								// 移動量
	fRot = CManager::GetRenderer()->GetCamera()->GetRot().y;	// カメラ回転

	// 移動 //
	/* ジョイパッド */
	// パッド用 //
	int nValueH, nValueV;	// ゲームパッドのスティック情報の取得用
	float fMove;			// 移動速度
	float fAngle;			// スティック角度の計算用変数
	fAngle = 0.0f;			// 角度

	if (CManager::GetJoy() != NULL)
	{
		// ゲームパッドのスティック情報を取得
		CManager::GetJoy()->GetStickLeft(0, nValueH, nValueV);

		/* プレイヤー移動 */
		// ゲームパッド移動
		if (nValueH != 0 || nValueV != 0)
		{
			// 角度の計算
			fAngle = atan2f((float)nValueH, (float)nValueV);

			if (fAngle > D3DX_PI)
			{
				fAngle -= D3DX_PI * 2;
			}
			else if (fAngle < -D3DX_PI)
			{
				fAngle += D3DX_PI * 2;
			}
			// 速度の計算
			if (abs(nValueH) > abs(nValueV))
			{
				fMove = (abs(nValueH) * CCharacter::GetStatus().fMaxMove) / 1024.0f;
			}
			else
			{
				fMove = (abs(nValueV) * CCharacter::GetStatus().fMaxMove) / 1024.0f;
			}
			rot.y = fAngle + fRot;

			// スティックの角度によってプレイヤー移動
			move.x -= sinf(fAngle + fRot) * (fMove);
			move.z -= cosf(fAngle + fRot) * (fMove);
			// 移動状態on
			bMove = true;
		}
		// 風船がNULLではないなら
		if (CCharacter_Balloon::GetBalloon() != NULL)
		{
			if (CCharacter_Balloon::GetBalloon()->GetPopBalloon_group() != 0)
			{
				// 宙に浮く
				if (CManager::GetJoy()->GetTrigger(0,CJoypad::KEY_A))
				{
					move.y += CCharacter::GetStatus().fMaxJump;
				}
			}
		}
	}
	/* キーボード */
	// 左
	if (CManager::GetKeyboard()->GetKeyboardPress(DIK_J))
	{
		// 移動状態on
		bMove = true;
		// 奥
		if (CManager::GetKeyboard()->GetKeyboardPress(DIK_I))
		{
			rot.y = -D3DX_PI * 0.25f + fRot;

			move.x += sinf(D3DX_PI * 0.75f + fRot) * CCharacter::GetStatus().fMaxMove;
			move.z += cosf(D3DX_PI * 0.75f + fRot) * CCharacter::GetStatus().fMaxMove;
		}
		// 手前
		else if (CManager::GetKeyboard()->GetKeyboardPress(DIK_K))
		{
			rot.y = -D3DX_PI * 0.75f + fRot;

			move.x += sinf(D3DX_PI * 0.25f + fRot) * CCharacter::GetStatus().fMaxMove;
			move.z += cosf(D3DX_PI * 0.25f + fRot) * CCharacter::GetStatus().fMaxMove;
		}
		// 左
		else
		{
			rot.y = -D3DX_PI * 0.5f + fRot;
			move.x += sinf(D3DX_PI * 0.5f + fRot) * CCharacter::GetStatus().fMaxMove;
			move.z += cosf(D3DX_PI * 0.5f + fRot) * CCharacter::GetStatus().fMaxMove;
		}
	}
	// 右
	else if (CManager::GetKeyboard()->GetKeyboardPress(DIK_L))
	{
		// 移動状態on
		bMove = true;

		// 奥
		if (CManager::GetKeyboard()->GetKeyboardPress(DIK_I))
		{
			rot.y = D3DX_PI * 0.25f + fRot;

			move.x += sinf(-D3DX_PI * 0.75f + fRot) * CCharacter::GetStatus().fMaxMove;
			move.z += cosf(-D3DX_PI * 0.75f + fRot) * CCharacter::GetStatus().fMaxMove;
		}
		// 手前
		else if (CManager::GetKeyboard()->GetKeyboardPress(DIK_K))
		{
			rot.y = D3DX_PI * 0.75f + fRot;

			move.x += sinf(-D3DX_PI * 0.25f + fRot) * CCharacter::GetStatus().fMaxMove;
			move.z += cosf(-D3DX_PI * 0.25f + fRot) * CCharacter::GetStatus().fMaxMove;
		}
		// 右
		else
		{
			rot.y = D3DX_PI * 0.5f + fRot;

			move.x += sinf(-D3DX_PI * 0.5f + fRot) * CCharacter::GetStatus().fMaxMove;
			move.z += cosf(-D3DX_PI * 0.5f + fRot) * CCharacter::GetStatus().fMaxMove;
		}
	}
	// 奥に行く
	else if (CManager::GetKeyboard()->GetKeyboardPress(DIK_I))
	{
		// 移動状態on
		bMove = true;
		rot.y = D3DX_PI * 0.0f + fRot;
		move.x += sinf(-D3DX_PI * 1.0f + fRot) * CCharacter::GetStatus().fMaxMove;
		move.z += cosf(-D3DX_PI * 1.0f + fRot) * CCharacter::GetStatus().fMaxMove;
	}
	// 手前に行く
	else if (CManager::GetKeyboard()->GetKeyboardPress(DIK_K))
	{
		// 移動状態on
		bMove = true;
		rot.y = D3DX_PI * 1.0f + fRot;
		move.x += sinf(D3DX_PI * 0.0f + fRot) * CCharacter::GetStatus().fMaxMove;
		move.z += cosf(D3DX_PI * 0.0f + fRot) * CCharacter::GetStatus().fMaxMove;
	}
	// 風船がNULLではないなら
	if (CCharacter_Balloon::GetBalloon() != NULL)
	{
		if (CCharacter_Balloon::GetBalloon()->GetPopBalloon_group() != 0)
		{
			// 宙に浮く
			if (CManager::GetKeyboard()->GetKeyboardPress(DIK_O))
			{
				move.y += CCharacter::GetStatus().fMaxJump;
			}
		}
	}
	// 移動状態なら
	if (bMove == true)
	{
		CCharacter::SetMotion(MOTIONTYPE_MOVE);
	}
	// yの上限設定
	if (move.y > 10.0f)
	{
		move.y = 10.0f;
	}
	if (move.y < -5.0f)
	{
		move.y = -5.0f;
	}
	CCharacter::SetMove(move);
	CCharacter::SetRotDest(rot);
}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// AI行動_ジャンプ状態
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CEnemy::AiAction_Jump(void)
{
	// クーリングタイムが30超過なら
	if (m_Jump.nCoolTime > 10)
	{
		// 変数宣言
		D3DXVECTOR3 move = CCharacter::GetMove();	// 移動量
		// yの移動量を加算
		move.y += CCharacter::GetStatus().fMaxJump;
		// 移動量設定
		CCharacter::SetMove(move);
		// 初期化
		m_Jump.nCoolTime = 0;	// クーリングタイム
	}
	// クーリングタイムアップ
	m_Jump.nCoolTime++;
}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 描画処理
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CEnemy::Draw(void)
{
	// キャラクター描画処理
	CCharacter_Balloon::Draw();
}

#ifdef _DEBUG
//-------------------------------------------------------------------------------------------------------------
// デバッグ表示
//-------------------------------------------------------------------------------------------------------------
void CEnemy::Debug(void)
{
	CCharacter_Balloon::Debug();
}
#endif // _DEBUG

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 当たった後の処理
//	nObjType	: オブジェクトタイプ
//	pScene		: 相手のシーン情報
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CEnemy::Scene_MyCollision(int const & nObjType, CScene * pScene)
{
	CCharacter_Balloon::Scene_MyCollision(nObjType, pScene);
}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 相手に当てられた後の処理
//	nObjType	: オブジェクトタイプ
//	pScene		: 相手のシーン情報
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CEnemy::Scene_OpponentCollision(int const & nObjType, CScene * pScene)
{
	CCharacter_Balloon::Scene_OpponentCollision(nObjType, pScene);
}

//-------------------------------------------------------------------------------------------------------------
// 死亡処理
//-------------------------------------------------------------------------------------------------------------
void CEnemy::Die(void)
{
	CDebugproc::Print("----敵情報----\n");
	CCharacter_Balloon::Die();
}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 読み込み処理
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
HRESULT CEnemy::Load(void)
{
	return S_OK;
}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 読み込んだ情報を破棄処理
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CEnemy::UnLoad(void)
{
}