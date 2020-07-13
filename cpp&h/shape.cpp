// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//
// Shape処理の説明[shape.cpp]
// Author : Koki Nishiyama
//
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//
// インクルードファイル
//
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#include "shape.h"
#include "Calculation.h"

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//
// Shape処理
//
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// コンストラクタ
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CShape::CShape()
{
	m_pmove = NULL;					// 移動量
	m_pPos = NULL;					// ポインター位置情報
	m_pos = D3DVECTOR3_ZERO;		// 位置情報
	m_pPosold = NULL;				// 過去のポインター位置情報
	m_posold = D3DVECTOR3_ZERO;		// 過去の位置情報
	m_bPush = false;				// 押し出し処理があるかない
	m_bOpponentPush = false;		// 相手に押し出し処理を付けるか付けないか
	m_offset = D3DVECTOR3_ZERO;		// オフセット座標
	m_pCorePos = &m_pos;			// 位置情報の絶対的変数
	m_pCorePosOld = &m_posold;		// 過去の位置情報の絶対的変数
	m_DestPos = D3DVECTOR3_ZERO;	// オフセットを足した、最終的な位置情報
	m_DestPosOld = D3DVECTOR3_ZERO;	// オフセットを足した、過去の最終的な位置情報
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 行列からの位置情報代入
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CShape::PassMatrix(D3DXMATRIX const & mtx)
{
	// 過去の位置情報保存
	m_posold = m_pos;
	// 最大座標値の設定
	D3DXVec3TransformCoord(&m_pos, &this->GetOffset(), &mtx);
	// 最終的な位置情報の設定
	Set_DestPos();
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 回転情報からの位置情報代入
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CShape::PassPos(D3DXVECTOR3 const & rot)
{
	// 最終的な位置情報の設定
	Set_DestPos();
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//
// RectShape処理
//
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 矩形クラスの作成処理
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
std::unique_ptr<CRectShape> CRectShape::Create(
	D3DXVECTOR3 const &offset,
	D3DXVECTOR3 const &size,
	bool const &bPush,
	bool const &bOpponentPush,
	D3DXVECTOR3 * pPos,
	D3DXVECTOR3 * pPosold
)
{
	// 変数宣言
	std::unique_ptr<CRectShape> pRect(new CRectShape);
	// 半径の設定
	pRect->SetSize(size);
	// 引数として渡された位置情報がNULLではないなら
	// ->位置情報を設定する
	if (pPos != NULL)
	{
		// ポインター位置情報の設定
		pRect->Set_PPos(pPos);
	}
	// 引数として渡された過去の位置情報がNULLではないなら
	// ->過去の位置情報を設定する
	if (pPosold != NULL)
	{
		// 過去のポインター位置情報設定
		pRect->Set_PPosold(pPosold);
	}
	// 最終的な位置情報の設定
	pRect->Set_DestPos();
	// 押し出し処理のありなし設定
	pRect->m_bPush = bPush;
	// 相手に押し出し処理を付けるか付けないか設定
	pRect->m_bOpponentPush = bOpponentPush;
	// オフセットの設定
	pRect->SetOffset(offset);
	return pRect;
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 矩形の最大座標値と最小座標値の計算
// 1:行列情報
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CRectShape::PassMatrix(
	D3DXMATRIX const &mtx
)
{
	// 過去の最大・最小座標の代入
	m_MinOld = m_Min;
	m_MaxOld = m_Max;
	// 位置情報設定
	CShape::PassMatrix(mtx);
	// 最小座標値の設定
	D3DXVec3TransformCoord(&m_Min, &(this->GetOffset() - m_size), &mtx);
	// 最大座標値の設定
	D3DXVec3TransformCoord(&m_Max, &(this->GetOffset() + m_size), &mtx);
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 矩形の最大座標値と最小座標値の計算
// 1:位置情報,2:回転情報
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CRectShape::PassPos(D3DXVECTOR3 const & rot)
{
	// 過去の最大・最小座標の代入
	m_MinOld = m_Min;
	m_MaxOld = m_Max;
	// 最大座標値の計算
	m_Max = *m_pCorePos + this->GetOffset() + m_size * 0.5f;
	// 最小座標値の計算
	m_Min = *m_pCorePos + this->GetOffset() - m_size * 0.5f;
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// ある座標から最も近い、ボックス上の座標を返す
// 1:位置情報
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
D3DXVECTOR3 CRectShape::GetClosestpoint(D3DXVECTOR3 const & pos)
{
	// 変数宣言
	D3DXVECTOR3 r_pos;	// ボックス上の座標
	// ある座標がボックスの最小座標値より低い場合
	if (pos.x < m_Min.x)
	{
		// 最小座標値を代入
		r_pos.x = m_Min.x;
	}
	// ある座標がボックスの最大座標値より低い場合
	else if (pos.x > m_Max.x)
	{
		// 最大座標値を代入
		r_pos.x = m_Max.x;
	}
	// それ以外
	else
	{
		// ある座標を代入
		r_pos.x = pos.x;
	}

	// ある座標がボックスの最小座標値より低い場合
	if (pos.y < m_Min.y)
	{
		// 最小座標値を代入
		r_pos.y = m_Min.y;
	}
	// ある座標がボックスの最大座標値より低い場合
	else if (pos.y > m_Max.y)
	{
		// 最大座標値を代入
		r_pos.y = m_Max.y;
	}
	// それ以外
	else
	{
		// ある座標を代入
		r_pos.y = pos.y;
	}

	// ある座標がボックスの最小座標値より低い場合
	if (pos.z < m_Min.z)
	{
		// 最小座標値を代入
		r_pos.z = m_Min.z;
	}
	// ある座標がボックスの最大座標値より低い場合
	else if (pos.z > m_Max.z)
	{
		// 最大座標値を代入
		r_pos.z = m_Max.z;
	}
	// それ以外
	else
	{
		// ある座標を代入
		r_pos.z = pos.z;
	}
	return r_pos;
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//
// SphereShape処理
//
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 球クラスの作成処理
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
std::unique_ptr<CSphereShape> CSphereShape::Create(
	D3DXVECTOR3 const &offset,
	float const &radius,
	bool const &bPush,
	bool const &bOpponentPush,
	D3DXVECTOR3 * pPos,
	D3DXVECTOR3 * pPosold
	)
{
	// 変数宣言
	std::unique_ptr<CSphereShape> pSphere(new CSphereShape);
	// オフセットの設定
	pSphere->SetOffset(offset);
	// 引数として渡された位置情報がNULLではないなら
	// ->位置情報を設定する
	if (pPos != NULL)
	{
		// ポインター位置情報設定
		pSphere->Set_PPos(pPos);
	}
	// 引数として渡された過去の位置情報がNULLではないなら
	// ->過去の位置情報を設定する
	if (pPosold != NULL)
	{
		// 過去のポインター位置情報設定
		pSphere->Set_PPosold(pPosold);
	}
	// 最終的な位置情報の設定
	pSphere->Set_DestPos();
	// 押し出し処理のありなし設定
	pSphere->m_bPush = bPush;
	// 相手に押し出し処理を付けるか付けないか設定
	pSphere->m_bOpponentPush = bOpponentPush;
	// 半径の設定
	pSphere->SetRadius(radius);
	return pSphere;
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 行列情報受け渡し
// 1:行列情報
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CSphereShape::PassMatrix(D3DXMATRIX const & mtx)
{
	CShape::PassMatrix(mtx);
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 行列情報受け渡し
// 1:回転情報
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void CSphereShape::PassPos(D3DXVECTOR3 const & rot)
{
	CShape::PassPos(rot);
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//
// ColumnShape処理
//
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 円柱クラスの作成処理
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
std::unique_ptr<CColumnShape> CColumnShape::Create(
	D3DXVECTOR3 const &offset,
	float const & fRadius,
	float const & fVertical,
	bool const &bPush,
	bool const &bOpponentPush,
	D3DXVECTOR3 * pPos,
	D3DXVECTOR3 * pPosold
)
{
	// 変数宣言
	std::unique_ptr<CColumnShape> pColum(new CColumnShape);
	// オフセットの設定
	pColum->SetOffset(offset);
	// 引数として渡された位置情報がNULLではないなら
	// ->位置情報を設定する
	if (pPos != NULL)
	{
		// 位置設定
		pColum->Set_PPos(pPos);
	}
	// 引数として渡された過去の位置情報がNULLではないなら
	// ->過去の位置情報を設定する
	if (pPosold != NULL)
	{
		// 過去のポインター位置情報設定
		pColum->Set_PPosold(pPosold);
	}
	// 最終的な位置情報の設定
	pColum->Set_DestPos();
	// 半径の設定
	pColum->SetRadius(fRadius);
	// 押し出し処理のありなし設定
	pColum->m_bPush = bPush;
	// 相手に押し出し処理を付けるか付けないか設定
	pColum->m_bOpponentPush = bOpponentPush;
	// 縦幅の設定
	pColum->SetVertical(fVertical);
	return pColum;
}