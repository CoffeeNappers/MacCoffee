.class final Lcom/my/tracker/providers/d$c;
.super Ljava/lang/Object;
.source "EnvironmentParamsDataProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/my/tracker/providers/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "c"
.end annotation


# instance fields
.field public a:Landroid/net/wifi/WifiInfo;

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/net/wifi/ScanResult;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .prologue
    .line 193
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 196
    :try_start_0
    const-string/jumbo v0, "wifi"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiManager;

    .line 197
    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 199
    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v1

    iput-object v1, p0, Lcom/my/tracker/providers/d$c;->a:Landroid/net/wifi/WifiInfo;

    .line 200
    invoke-static {p1}, Lcom/my/tracker/providers/d;->c(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 201
    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->getScanResults()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/my/tracker/providers/d$c;->b:Ljava/util/List;

    .line 202
    :cond_0
    iget-object v0, p0, Lcom/my/tracker/providers/d$c;->b:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 204
    iget-object v0, p0, Lcom/my/tracker/providers/d$c;->b:Ljava/util/List;

    new-instance v1, Lcom/my/tracker/providers/d$c$1;

    invoke-direct {v1, p0}, Lcom/my/tracker/providers/d$c$1;-><init>(Lcom/my/tracker/providers/d$c;)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 222
    :cond_1
    :goto_0
    return-void

    .line 218
    :catch_0
    move-exception v0

    const-string/jumbo v0, "Permission android.permission.ACCESS_WIFI_STATE check was positive, but still got security exception on the wifi provider"

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    goto :goto_0
.end method
