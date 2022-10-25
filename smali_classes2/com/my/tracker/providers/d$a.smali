.class final Lcom/my/tracker/providers/d$a;
.super Ljava/lang/Object;
.source "EnvironmentParamsDataProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/my/tracker/providers/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation


# instance fields
.field public a:Landroid/telephony/gsm/GsmCellLocation;

.field public b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .prologue
    .line 232
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 233
    const-string/jumbo v0, "phone"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 236
    const/4 v1, 0x0

    .line 237
    :try_start_0
    invoke-static {p1}, Lcom/my/tracker/providers/d;->c(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 238
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getCellLocation()Landroid/telephony/CellLocation;

    move-result-object v1

    .line 239
    :cond_0
    if-eqz v1, :cond_1

    instance-of v2, v1, Landroid/telephony/gsm/GsmCellLocation;

    if-eqz v2, :cond_1

    .line 241
    check-cast v1, Landroid/telephony/gsm/GsmCellLocation;

    iput-object v1, p0, Lcom/my/tracker/providers/d$a;->a:Landroid/telephony/gsm/GsmCellLocation;

    .line 243
    :cond_1
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getNetworkOperator()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/my/tracker/providers/d$a;->b:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 250
    :goto_0
    return-void

    .line 246
    :catch_0
    move-exception v0

    const-string/jumbo v0, "Permission android.permission.ACCESS_COARSE_LOCATION check was positive, but still got security exception on the cell provider"

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    goto :goto_0
.end method
