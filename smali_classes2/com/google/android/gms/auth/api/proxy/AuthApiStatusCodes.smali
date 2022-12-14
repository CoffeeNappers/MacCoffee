.class public Lcom/google/android/gms/auth/api/proxy/AuthApiStatusCodes;
.super Lcom/google/android/gms/common/api/CommonStatusCodes;


# static fields
.field public static final AUTH_API_ACCESS_FORBIDDEN:I = 0xbb9

.field public static final AUTH_API_CLIENT_ERROR:I = 0xbba

.field public static final AUTH_API_INVALID_CREDENTIALS:I = 0xbb8

.field public static final AUTH_API_SERVER_ERROR:I = 0xbbb

.field public static final AUTH_APP_CERT_ERROR:I = 0xbbe

.field public static final AUTH_TOKEN_ERROR:I = 0xbbc

.field public static final AUTH_URL_RESOLUTION:I = 0xbbd


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/common/api/CommonStatusCodes;-><init>()V

    return-void
.end method

.method public static getStatusCodeString(I)Ljava/lang/String;
    .locals 1

    packed-switch p0, :pswitch_data_0

    invoke-static {p0}, Lcom/google/android/gms/common/api/CommonStatusCodes;->getStatusCodeString(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :pswitch_0
    const-string/jumbo v0, "AUTH_API_INVALID_CREDENTIALS"

    goto :goto_0

    :pswitch_1
    const-string/jumbo v0, "AUTH_API_ACCESS_FORBIDDEN"

    goto :goto_0

    :pswitch_2
    const-string/jumbo v0, "AUTH_API_CLIENT_ERROR"

    goto :goto_0

    :pswitch_3
    const-string/jumbo v0, "AUTH_API_SERVER_ERROR"

    goto :goto_0

    :pswitch_4
    const-string/jumbo v0, "AUTH_TOKEN_ERROR"

    goto :goto_0

    :pswitch_5
    const-string/jumbo v0, "AUTH_URL_RESOLUTION"

    goto :goto_0

    :pswitch_6
    const-string/jumbo v0, "AUTH_APP_CERT_ERROR"

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0xbb8
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method
