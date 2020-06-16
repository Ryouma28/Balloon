// ----------------------------------------------------------------------------------------------------
//
// RectCollisionヘッダー処理の説明[rectcollision.h]
// Author : Koki Nishiyama
//
// ----------------------------------------------------------------------------------------------------

#ifndef _RECTCOLLISION_H_
#define _RECTCOLLISION_H_	 // ファイル名を基準を決める

// ----------------------------------------------------------------------------------------------------
//
// インクルードファイル
//
// ----------------------------------------------------------------------------------------------------
#include "collision.h"

// ----------------------------------------------------------------------------------------------------
//
// マクロ定義
//
// ----------------------------------------------------------------------------------------------------
#define RECTCOLLISION_MAX (128)

// ----------------------------------------------------------------------------------------------------
//
// RectCollision種類
//
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
//
// 構造体定義
//
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//
// 名前定義
//
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//
// 前方宣言
//
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//
// クラス
//
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
class CRectCollision : public CCollision
{
public:
	/* 列挙型 */
	/* 構造体 */
	typedef struct
	{
		D3DXVECTOR3 pos;
		D3DXVECTOR3 size;
	} INFO;
	/* 関数 */
	CRectCollision();
	~CRectCollision() {};
	void Init(void);
	void Uninit(void) {};
	void Update(void) {};
	void Draw(void) {};
#ifdef _DEBUG
	void Debug(void) {};
#endif // _DEBUG
	// 形の取得
	CShape * const GetShape(void) { return m_pRectShape.get(); };
	// 矩形の取得
	CRectShape * const GetRectShape(void) { return m_pRectShape.get(); };
	// 矩形クラスの当たり判定比較
	bool Judg(CRectShape * const RectShape);
	// 矩形クラスの当たり判定比較(押し出し処理)
	bool Judg(CRectShape * const RectShape, D3DXVECTOR3 * pPos);
	// 球クラスの当たり判定比較
	bool Judg(CSphereShape * const SphereShape);
	// 円柱クラスの当たり判定比較
	bool Judg(CColumnShape * const ColumnShape);
	// 設定
	// 作成処理(シーン管理)
	static CRectCollision *Create(
		D3DXVECTOR3 const offset,
		D3DXVECTOR3 const size,
		OBJTYPE const &obj = OBJTYPE_ACTOR
	);
	// 作成処理(個人管理)
	static unique_ptr<CRectCollision> Create_Self(
		D3DXVECTOR3 const offset,
		D3DXVECTOR3 const size,
		OBJTYPE const &obj = OBJTYPE_ACTOR
	);

protected:

private:
	// 変数宣言
	unique_ptr<CRectShape> m_pRectShape;	// 矩形
};

// ----------------------------------------------------------------------------------------------------
//
// プロトタイプ宣言
//
// ----------------------------------------------------------------------------------------------------

#endif