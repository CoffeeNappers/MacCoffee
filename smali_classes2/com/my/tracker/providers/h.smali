.class public final Lcom/my/tracker/providers/h;
.super Lcom/my/tracker/providers/a;
.source "NetworkInfoDataProvider.java"


# instance fields
.field private a:Z

.field private b:Ljava/lang/String;

.field private c:Ljava/lang/String;

.field private d:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/my/tracker/providers/a;-><init>()V

    .line 36
    const/4 v0, -0x1

    iput v0, p0, Lcom/my/tracker/providers/h;->d:I

    .line 51
    return-void
.end method


# virtual methods
.method public final a(Lcom/my/tracker/builders/a;)V
    .locals 2

    .prologue
    .line 127
    iget-object v0, p0, Lcom/my/tracker/providers/h;->b:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/tracker/providers/h;->c:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 129
    :cond_0
    iget-object v0, p0, Lcom/my/tracker/providers/h;->b:Ljava/lang/String;

    iget-object v1, p0, Lcom/my/tracker/providers/h;->c:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/my/tracker/builders/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    :cond_1
    iget v0, p0, Lcom/my/tracker/providers/h;->d:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    iget v0, p0, Lcom/my/tracker/providers/h;->d:I

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->d(I)V

    .line 135
    :cond_2
    return-void
.end method

.method public final a()Z
    .locals 1

    .prologue
    .line 43
    iget-boolean v0, p0, Lcom/my/tracker/providers/h;->a:Z

    return v0
.end method

.method public final b(Landroid/content/Context;)V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 59
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_1

    .line 61
    const-string/jumbo v0, "NetworkInfoDataProvider: You must not call collectData method from main thread"

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 123
    :cond_0
    :goto_0
    return-void

    .line 65
    :cond_1
    iput-boolean v2, p0, Lcom/my/tracker/providers/h;->a:Z

    .line 66
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/my/tracker/providers/h;->b:Ljava/lang/String;

    .line 67
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/my/tracker/providers/h;->c:Ljava/lang/String;

    .line 69
    const-string/jumbo v0, "android.permission.ACCESS_NETWORK_STATE"

    invoke-static {v0, p1}, Lcom/my/tracker/utils/d;->a(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 73
    :try_start_0
    const-string/jumbo v0, "connectivity"

    .line 74
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 76
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    .line 77
    if-eqz v1, :cond_7

    .line 79
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v0

    iput-boolean v0, p0, Lcom/my/tracker/providers/h;->a:Z

    .line 80
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object v0

    :goto_1
    iput-object v0, p0, Lcom/my/tracker/providers/h;->b:Ljava/lang/String;

    .line 83
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getType()I

    move-result v0

    if-nez v0, :cond_5

    .line 85
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getSubtypeName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 86
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getSubtypeName()Ljava/lang/String;

    move-result-object v0

    :goto_2
    iput-object v0, p0, Lcom/my/tracker/providers/h;->c:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1

    .line 99
    :cond_2
    :goto_3
    invoke-static {}, Lcom/my/tracker/utils/d;->a()Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "android.permission.BLUETOOTH"

    .line 100
    invoke-static {v0, p1}, Lcom/my/tracker/utils/d;->a(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 104
    :try_start_1
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    .line 105
    if-eqz v0, :cond_0

    .line 107
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 109
    const/4 v0, 0x1

    iput v0, p0, Lcom/my/tracker/providers/h;->d:I
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 118
    :catch_0
    move-exception v0

    const-string/jumbo v0, "Permission android.permission.BLUETOOTH check was positive, but still got security exception on the bluetooth provider"

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    goto :goto_0

    .line 80
    :cond_3
    :try_start_2
    const-string/jumbo v0, ""

    goto :goto_1

    .line 86
    :cond_4
    const-string/jumbo v0, ""

    goto :goto_2

    .line 90
    :cond_5
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_6

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object v0

    :goto_4
    iput-object v0, p0, Lcom/my/tracker/providers/h;->c:Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_3

    .line 95
    :catch_1
    move-exception v0

    const-string/jumbo v0, "No permissions for access to network state"

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    goto :goto_3

    .line 90
    :cond_6
    :try_start_3
    const-string/jumbo v0, ""

    goto :goto_4

    .line 92
    :cond_7
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/my/tracker/providers/h;->a:Z
    :try_end_3
    .catch Ljava/lang/SecurityException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_3

    .line 113
    :cond_8
    const/4 v0, 0x0

    :try_start_4
    iput v0, p0, Lcom/my/tracker/providers/h;->d:I
    :try_end_4
    .catch Ljava/lang/SecurityException; {:try_start_4 .. :try_end_4} :catch_0

    goto/16 :goto_0
.end method
