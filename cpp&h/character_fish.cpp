// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//
// ���L�����N�^�[���� [character_fish.cpp]
// Author : KOKI NISHIYAMA
//
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#include "character_fish.h"
#include "player.h"
#include "3Dparticle.h"
#include "game.h"
#include "circleshadow.h"
#include "camera.h"

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//
// �}�N����`
//
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#define CHARACTER_FISH_MOVE	(D3DXVECTOR3(0.0f,7.0f,0.0f))	// ���̈ړ���
#define CHARACTER_FISH_YPOS	(10.0f)						// y�̈ʒu
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//
// �ÓI�ϐ��錾
//
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// �I�[�o�[���[�h�R���X�g���N�^(�q���p)
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CCharacter_Fish::CCharacter_Fish() : CCharacter::CCharacter(CCharacter::CHARACTER_FISH)
{
	// �ړ��ʐݒ�
	CCharacter::SetMove(CHARACTER_FISH_MOVE);
}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// �f�X�g���N�^����
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CCharacter_Fish::~CCharacter_Fish()
{
}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// ����������
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CCharacter_Fish::Init(void)
{
	// �L�����N�^�[������
	CCharacter::Init();
}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// �I������
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CCharacter_Fish::Uninit(void)
{
	// �L�����N�^�[�I������
	CCharacter::Uninit();
}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// �X�V����
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CCharacter_Fish::Update(void)
{
	// AI�A�N�V��������
	Ai_Action();
	// �L�����N�^�[�X�V����
	CCharacter::Update();
}


// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// AI�A�N�V��������
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CCharacter_Fish::Ai_Action(void)
{
	// AI�ړ�����
	Ai_Move();
}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// AI�ړ�����
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CCharacter_Fish::Ai_Move(void)
{

}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// �`�揈��
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CCharacter_Fish::Draw(void)
{
	// �L�����N�^�[�`�揈��
	CCharacter::Draw();
}

#ifdef _DEBUG
//-------------------------------------------------------------------------------------------------------------
// �f�o�b�O�\��
//-------------------------------------------------------------------------------------------------------------
void CCharacter_Fish::Debug(void)
{
	CCharacter::Debug();
}
#endif // _DEBUG

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// ����������̏���
//	nObjType	: �I�u�W�F�N�g�^�C�v
//	pScene		: ����̃V�[�����
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CCharacter_Fish::Scene_MyCollision(int const & nObjType, CScene * pScene)
{
	CCharacter::Scene_MyCollision(nObjType, pScene);
}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// ����ɓ��Ă�ꂽ��̏���
//	nObjType	: �I�u�W�F�N�g�^�C�v
//	pScene		: ����̃V�[�����
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CCharacter_Fish::Scene_OpponentCollision(int const & nObjType, CScene * pScene)
{
	CCharacter::Scene_OpponentCollision(nObjType, pScene);
}

//-------------------------------------------------------------------------------------------------------------
// ���S����
//-------------------------------------------------------------------------------------------------------------
void CCharacter_Fish::Die(void)
{
	CCharacter::Die();
}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// ����(�V�[���Ǘ�)����
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CCharacter_Fish * CCharacter_Fish::Create(D3DXVECTOR3 const & pos, D3DXVECTOR3 const & rot)
{
	// �ϐ��錾
	CCharacter_Fish * pCharacter_Fish;
	// �������̐���(����->��{�N���X,��->�h���N���X)
	pCharacter_Fish = new CCharacter_Fish();
	// �V�[���Ǘ��ݒ�
	pCharacter_Fish->ManageSetting(CScene::LAYER_CHARACTER);
	// �ݒ�
	pCharacter_Fish->SetPos(D3DXVECTOR3(pos.x,CHARACTER_FISH_YPOS,pos.z));
	pCharacter_Fish->SetRot(rot);
	pCharacter_Fish->SetRotDest(rot);
	// ����������
	pCharacter_Fish->Init();
	// �ݒ�
	// ���������I�u�W�F�N�g��Ԃ�
	return pCharacter_Fish;
}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// ����(�l�Ǘ�)����
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CCharacter_Fish * CCharacter_Fish::Create_Self(D3DXVECTOR3 const & pos, D3DXVECTOR3 const & rot)
{
	// �ϐ��錾
	CCharacter_Fish * pCharacter_Fish;
	// �������̐���(����->��{�N���X,��->�h���N���X)
	pCharacter_Fish = new CCharacter_Fish();
	// �ݒ�
	pCharacter_Fish->SetPos(pos);
	pCharacter_Fish->SetRot(rot);
	pCharacter_Fish->SetRotDest(rot);
	// ����������
	pCharacter_Fish->Init();
	// �ݒ�
	// ���������I�u�W�F�N�g��Ԃ�
	return pCharacter_Fish;
}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// �ǂݍ��ݏ���
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
HRESULT CCharacter_Fish::Load(void)
{
	return S_OK;
}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// �ǂݍ��񂾏���j������
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CCharacter_Fish::UnLoad(void)
{
}