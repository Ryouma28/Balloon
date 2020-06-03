// ----------------------------------------------------------------------------------------------------
//
// ネットワークの説明[network.h]
// Author : masayasu wakita
//
// ----------------------------------------------------------------------------------------------------
#ifndef _NETWORK_H_
#define _NETWORK_H_	 // ファイル名を基準を決める

// ----------------------------------------------------------------------------------------------------
//
// インクルードファイル
//
// ----------------------------------------------------------------------------------------------------
#include "main.h"
#include "keyboard.h"

// ----------------------------------------------------------------------------------------------------
//
// マクロ定義
//
// ----------------------------------------------------------------------------------------------------
#define SCRIPT_NETWORK "network.ini"
#define MAX_PLAYER 4

// ----------------------------------------------------------------------------------------------------
//
// 構造体定義
//
// ----------------------------------------------------------------------------------------------------
typedef struct
{
	BYTE m_aKeyState[MAX_PLAYER][NUM_KEY_MAX] = {};				// キーボードのプレス状態
} KEYSTATE;

// ----------------------------------------------------------------------------------------------------
//
// クラス
//
// ----------------------------------------------------------------------------------------------------
class CNetwork
{
public:
	/* 関数 */
	CNetwork();
	~CNetwork();
	HRESULT Init(HINSTANCE hInstance, HWND hWnd);
	void Uninit(void);
	void Update(void);

	static HRESULT LoadConfiguration(void);

	HRESULT Build(void);
	HRESULT Connect(void);

	KEYSTATE GetKeystate(void);

private:

	SOCKET m_sockClient;								//ソケット(クライアント)
	struct sockaddr_in m_addrServer;					//ソケットアドレス(サーバ)の情報
	KEYSTATE keystate;

	static char aIp[32];				// IPアドレス
	static int nPort;					// ポート番号
};
#endif // !_NETWORK_H_