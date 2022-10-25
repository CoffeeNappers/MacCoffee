.class public final Lcom/my/tracker/providers/d;
.super Lcom/my/tracker/providers/a;
.source "EnvironmentParamsDataProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/my/tracker/providers/d$b;,
        Lcom/my/tracker/providers/d$d;,
        Lcom/my/tracker/providers/d$a;,
        Lcom/my/tracker/providers/d$c;
    }
.end annotation


# instance fields
.field private a:Lcom/my/tracker/providers/d$d;

.field private b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/my/tracker/providers/d$d;",
            ">;"
        }
    .end annotation
.end field

.field private c:Lcom/my/tracker/providers/d$b;

.field private d:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 62
    invoke-direct {p0}, Lcom/my/tracker/providers/a;-><init>()V

    .line 49
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/my/tracker/providers/d;->d:Z

    .line 63
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/my/tracker/providers/d;->b:Ljava/util/ArrayList;

    .line 64
    return-void
.end method

.method static synthetic c(Landroid/content/Context;)Z
    .locals 1

    .prologue
    .line 2068
    const-string/jumbo v0, "android.permission.ACCESS_FINE_LOCATION"

    invoke-static {v0, p0}, Lcom/my/tracker/utils/d;->a(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "android.permission.ACCESS_COARSE_LOCATION"

    .line 2069
    invoke-static {v0, p0}, Lcom/my/tracker/utils/d;->a(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    .line 34
    goto :goto_0
.end method


# virtual methods
.method public final a(Lcom/my/tracker/builders/a;)V
    .locals 3

    .prologue
    .line 284
    iget-boolean v0, p0, Lcom/my/tracker/providers/d;->d:Z

    if-nez v0, :cond_0

    .line 286
    :goto_0
    return-void

    .line 285
    :cond_0
    iget-object v0, p0, Lcom/my/tracker/providers/d;->c:Lcom/my/tracker/providers/d$b;

    iget-object v1, p0, Lcom/my/tracker/providers/d;->a:Lcom/my/tracker/providers/d$d;

    iget-object v2, p0, Lcom/my/tracker/providers/d;->b:Ljava/util/ArrayList;

    invoke-virtual {p1, v0, v1, v2}, Lcom/my/tracker/builders/a;->a(Lcom/my/tracker/providers/d$b;Lcom/my/tracker/providers/d$d;Ljava/util/ArrayList;)V

    goto :goto_0
.end method

.method public final a(Z)V
    .locals 0

    .prologue
    .line 53
    iput-boolean p1, p0, Lcom/my/tracker/providers/d;->d:Z

    .line 54
    return-void
.end method

.method public final declared-synchronized b(Landroid/content/Context;)V
    .locals 8

    .prologue
    .line 79
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/my/tracker/providers/d;->d:Z

    if-nez v0, :cond_1

    .line 81
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/my/tracker/providers/d;->c:Lcom/my/tracker/providers/d$b;

    .line 82
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/my/tracker/providers/d;->a:Lcom/my/tracker/providers/d$d;

    .line 83
    iget-object v0, p0, Lcom/my/tracker/providers/d;->b:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 97
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 87
    :cond_1
    :try_start_1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_2

    .line 89
    const-string/jumbo v0, "DeviceParamsDataProvider: You must not call collectData method from main thread"

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 79
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 93
    :cond_2
    :try_start_2
    const-string/jumbo v0, "android.permission.ACCESS_WIFI_STATE"

    invoke-static {v0, p1}, Lcom/my/tracker/utils/d;->a(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 1102
    new-instance v2, Lcom/my/tracker/providers/d$c;

    invoke-direct {v2, p1}, Lcom/my/tracker/providers/d$c;-><init>(Landroid/content/Context;)V

    .line 1103
    iget-object v0, p0, Lcom/my/tracker/providers/d;->b:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 1104
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/my/tracker/providers/d;->a:Lcom/my/tracker/providers/d$d;

    .line 1105
    iget-object v0, v2, Lcom/my/tracker/providers/d$c;->a:Landroid/net/wifi/WifiInfo;

    if-eqz v0, :cond_4

    .line 1107
    iget-object v3, v2, Lcom/my/tracker/providers/d$c;->a:Landroid/net/wifi/WifiInfo;

    .line 1108
    invoke-virtual {v3}, Landroid/net/wifi/WifiInfo;->getBSSID()Ljava/lang/String;

    move-result-object v0

    .line 1109
    if-nez v0, :cond_a

    const-string/jumbo v0, ""

    move-object v1, v0

    .line 1110
    :goto_1
    invoke-virtual {v3}, Landroid/net/wifi/WifiInfo;->getLinkSpeed()I

    move-result v4

    .line 1111
    invoke-virtual {v3}, Landroid/net/wifi/WifiInfo;->getNetworkId()I

    move-result v5

    .line 1112
    invoke-virtual {v3}, Landroid/net/wifi/WifiInfo;->getRssi()I

    move-result v6

    .line 1113
    invoke-virtual {v3}, Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;

    move-result-object v0

    .line 1114
    if-nez v0, :cond_3

    const-string/jumbo v0, ""

    .line 1116
    :cond_3
    new-instance v3, Lcom/my/tracker/providers/d$d;

    invoke-direct {v3}, Lcom/my/tracker/providers/d$d;-><init>()V

    iput-object v3, p0, Lcom/my/tracker/providers/d;->a:Lcom/my/tracker/providers/d$d;

    .line 1117
    iget-object v3, p0, Lcom/my/tracker/providers/d;->a:Lcom/my/tracker/providers/d$d;

    iput-object v0, v3, Lcom/my/tracker/providers/d$d;->a:Ljava/lang/String;

    .line 1118
    iget-object v3, p0, Lcom/my/tracker/providers/d;->a:Lcom/my/tracker/providers/d$d;

    iput-object v1, v3, Lcom/my/tracker/providers/d$d;->b:Ljava/lang/String;

    .line 1119
    iget-object v3, p0, Lcom/my/tracker/providers/d;->a:Lcom/my/tracker/providers/d$d;

    iput v6, v3, Lcom/my/tracker/providers/d$d;->c:I

    .line 1120
    iget-object v3, p0, Lcom/my/tracker/providers/d;->a:Lcom/my/tracker/providers/d$d;

    iput v5, v3, Lcom/my/tracker/providers/d$d;->d:I

    .line 1121
    iget-object v3, p0, Lcom/my/tracker/providers/d;->a:Lcom/my/tracker/providers/d$d;

    iput v4, v3, Lcom/my/tracker/providers/d$d;->e:I

    .line 1126
    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v7, "current wifi: "

    invoke-direct {v3, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v3, ","

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 1129
    :cond_4
    iget-object v0, v2, Lcom/my/tracker/providers/d$c;->b:Ljava/util/List;

    if-eqz v0, :cond_6

    .line 1131
    const/4 v1, 0x1

    .line 1132
    iget-object v0, v2, Lcom/my/tracker/providers/d$c;->b:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/ScanResult;

    .line 1134
    const/4 v2, 0x6

    if-ge v1, v2, :cond_9

    .line 1136
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget v3, v0, Landroid/net/wifi/ScanResult;->level:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 1137
    iget-object v2, v0, Landroid/net/wifi/ScanResult;->BSSID:Ljava/lang/String;

    .line 1138
    if-nez v2, :cond_8

    const-string/jumbo v2, ""

    move-object v3, v2

    .line 1139
    :goto_3
    iget-object v2, v0, Landroid/net/wifi/ScanResult;->SSID:Ljava/lang/String;

    .line 1140
    if-nez v2, :cond_5

    const-string/jumbo v2, ""

    .line 1142
    :cond_5
    new-instance v5, Lcom/my/tracker/providers/d$d;

    invoke-direct {v5}, Lcom/my/tracker/providers/d$d;-><init>()V

    .line 1143
    iput-object v2, v5, Lcom/my/tracker/providers/d$d;->a:Ljava/lang/String;

    .line 1144
    iput-object v3, v5, Lcom/my/tracker/providers/d$d;->b:Ljava/lang/String;

    .line 1145
    iget v6, v0, Landroid/net/wifi/ScanResult;->level:I

    iput v6, v5, Lcom/my/tracker/providers/d$d;->f:I

    .line 1146
    iget-object v6, p0, Lcom/my/tracker/providers/d;->b:Ljava/util/ArrayList;

    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1148
    new-instance v5, Ljava/lang/StringBuilder;

    const-string/jumbo v6, "wifi"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v5, ","

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v0, v0, Landroid/net/wifi/ScanResult;->level:I

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 1149
    add-int/lit8 v0, v1, 0x1

    :goto_4
    move v1, v0

    .line 1151
    goto :goto_2

    .line 95
    :cond_6
    const-string/jumbo v0, "android.permission.ACCESS_COARSE_LOCATION"

    invoke-static {v0, p1}, Lcom/my/tracker/utils/d;->a(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1159
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/my/tracker/providers/d;->c:Lcom/my/tracker/providers/d$b;

    .line 1160
    new-instance v0, Lcom/my/tracker/providers/d$a;

    invoke-direct {v0, p1}, Lcom/my/tracker/providers/d$a;-><init>(Landroid/content/Context;)V

    .line 1161
    iget-object v1, v0, Lcom/my/tracker/providers/d$a;->a:Landroid/telephony/gsm/GsmCellLocation;

    if-eqz v1, :cond_0

    .line 1163
    new-instance v1, Lcom/my/tracker/providers/d$b;

    const-string/jumbo v2, "gsm"

    invoke-direct {v1, v2}, Lcom/my/tracker/providers/d$b;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/my/tracker/providers/d;->c:Lcom/my/tracker/providers/d$b;

    .line 1164
    iget-object v1, p0, Lcom/my/tracker/providers/d;->c:Lcom/my/tracker/providers/d$b;

    iget-object v2, v0, Lcom/my/tracker/providers/d$a;->a:Landroid/telephony/gsm/GsmCellLocation;

    invoke-virtual {v2}, Landroid/telephony/gsm/GsmCellLocation;->getCid()I

    move-result v2

    iput v2, v1, Lcom/my/tracker/providers/d$b;->b:I

    .line 1165
    iget-object v1, p0, Lcom/my/tracker/providers/d;->c:Lcom/my/tracker/providers/d$b;

    iget-object v2, v0, Lcom/my/tracker/providers/d$a;->a:Landroid/telephony/gsm/GsmCellLocation;

    invoke-virtual {v2}, Landroid/telephony/gsm/GsmCellLocation;->getLac()I

    move-result v2

    iput v2, v1, Lcom/my/tracker/providers/d$b;->c:I

    .line 1167
    iget-object v1, v0, Lcom/my/tracker/providers/d$a;->b:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v1

    if-nez v1, :cond_7

    .line 1171
    :try_start_3
    iget-object v1, p0, Lcom/my/tracker/providers/d;->c:Lcom/my/tracker/providers/d$b;

    iget-object v2, v0, Lcom/my/tracker/providers/d$a;->b:Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x3

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    iput v2, v1, Lcom/my/tracker/providers/d$b;->e:I

    .line 1172
    iget-object v1, p0, Lcom/my/tracker/providers/d;->c:Lcom/my/tracker/providers/d$b;

    iget-object v0, v0, Lcom/my/tracker/providers/d$a;->b:Ljava/lang/String;

    const/4 v2, 0x3

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, v1, Lcom/my/tracker/providers/d$b;->f:I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1178
    :cond_7
    :goto_5
    :try_start_4
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "current cell: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/my/tracker/providers/d;->c:Lcom/my/tracker/providers/d$b;

    iget v1, v1, Lcom/my/tracker/providers/d$b;->b:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/my/tracker/providers/d;->c:Lcom/my/tracker/providers/d$b;

    iget v1, v1, Lcom/my/tracker/providers/d$b;->c:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/my/tracker/providers/d;->c:Lcom/my/tracker/providers/d$b;

    iget v1, v1, Lcom/my/tracker/providers/d$b;->e:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/my/tracker/providers/d;->c:Lcom/my/tracker/providers/d$b;

    iget v1, v1, Lcom/my/tracker/providers/d$b;->f:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_0

    :catch_0
    move-exception v0

    goto :goto_5

    :cond_8
    move-object v3, v2

    goto/16 :goto_3

    :cond_9
    move v0, v1

    goto/16 :goto_4

    :cond_a
    move-object v1, v0

    goto/16 :goto_1
.end method
