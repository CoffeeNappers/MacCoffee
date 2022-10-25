.class public Lcom/google/android/gms/internal/zzks;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzji;
.end annotation


# instance fields
.field private final zzako:Ljava/lang/Object;

.field final zzctq:Ljava/lang/String;

.field zzcui:I

.field zzcuj:J

.field zzcuk:J

.field zzcul:I

.field zzcum:I

.field zzcun:I


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 4

    const-wide/16 v2, -0x1

    const/4 v1, 0x0

    const/4 v0, -0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzks;->zzcuj:J

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzks;->zzcuk:J

    iput v0, p0, Lcom/google/android/gms/internal/zzks;->zzcul:I

    iput v0, p0, Lcom/google/android/gms/internal/zzks;->zzcui:I

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzks;->zzako:Ljava/lang/Object;

    iput v1, p0, Lcom/google/android/gms/internal/zzks;->zzcum:I

    iput v1, p0, Lcom/google/android/gms/internal/zzks;->zzcun:I

    iput-object p1, p0, Lcom/google/android/gms/internal/zzks;->zzctq:Ljava/lang/String;

    return-void
.end method

.method public static zzx(Landroid/content/Context;)Z
    .locals 5

    const/4 v0, 0x0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string/jumbo v2, "Theme.Translucent"

    const-string/jumbo v3, "style"

    const-string/jumbo v4, "android"

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "Please set theme of AdActivity to @android:style/Theme.Translucent to enable transparent background interstitial ad."

    invoke-static {v1}, Lcom/google/android/gms/internal/zzkx;->zzdh(Ljava/lang/String;)V

    :goto_0
    return v0

    :cond_0
    new-instance v2, Landroid/content/ComponentName;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "com.google.android.gms.ads.AdActivity"

    invoke-direct {v2, v3, v4}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v2, v4}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    move-result-object v2

    iget v2, v2, Landroid/content/pm/ActivityInfo;->theme:I

    if-ne v1, v2, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const-string/jumbo v1, "Please set theme of AdActivity to @android:style/Theme.Translucent to enable transparent background interstitial ad."

    invoke-static {v1}, Lcom/google/android/gms/internal/zzkx;->zzdh(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string/jumbo v1, "Fail to fetch AdActivity theme"

    invoke-static {v1}, Lcom/google/android/gms/internal/zzkx;->zzdi(Ljava/lang/String;)V

    const-string/jumbo v1, "Please set theme of AdActivity to @android:style/Theme.Translucent to enable transparent background interstitial ad."

    invoke-static {v1}, Lcom/google/android/gms/internal/zzkx;->zzdh(Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public zzb(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;J)V
    .locals 6

    iget-object v1, p0, Lcom/google/android/gms/internal/zzks;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-wide v2, p0, Lcom/google/android/gms/internal/zzks;->zzcuk:J

    const-wide/16 v4, -0x1

    cmp-long v0, v2, v4

    if-nez v0, :cond_1

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgq()Lcom/google/android/gms/internal/zzkr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzkr;->zzvc()J

    move-result-wide v2

    sub-long v2, p2, v2

    sget-object v0, Lcom/google/android/gms/internal/zzdr;->zzbgb:Lcom/google/android/gms/internal/zzdn;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzdn;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    cmp-long v0, v2, v4

    if-lez v0, :cond_0

    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzks;->zzbg(I)V

    :goto_0
    iput-wide p2, p0, Lcom/google/android/gms/internal/zzks;->zzcuk:J

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzks;->zzcuk:J

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzks;->zzcuj:J

    :goto_1
    iget-object v0, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->extras:Landroid/os/Bundle;

    if-eqz v0, :cond_2

    iget-object v0, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->extras:Landroid/os/Bundle;

    const-string/jumbo v2, "gw"

    const/4 v3, 0x2

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_2

    monitor-exit v1

    :goto_2
    return-void

    :cond_0
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgq()Lcom/google/android/gms/internal/zzkr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzkr;->zzvd()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzks;->zzbg(I)V

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_1
    :try_start_1
    iput-wide p2, p0, Lcom/google/android/gms/internal/zzks;->zzcuj:J

    goto :goto_1

    :cond_2
    iget v0, p0, Lcom/google/android/gms/internal/zzks;->zzcul:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzks;->zzcul:I

    iget v0, p0, Lcom/google/android/gms/internal/zzks;->zzcui:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzks;->zzcui:I

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2
.end method

.method public zzbg(I)V
    .locals 0

    iput p1, p0, Lcom/google/android/gms/internal/zzks;->zzcui:I

    return-void
.end method

.method public zze(Landroid/content/Context;Ljava/lang/String;)Landroid/os/Bundle;
    .locals 6

    iget-object v1, p0, Lcom/google/android/gms/internal/zzks;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string/jumbo v2, "session_id"

    iget-object v3, p0, Lcom/google/android/gms/internal/zzks;->zzctq:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string/jumbo v2, "basets"

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzks;->zzcuk:J

    invoke-virtual {v0, v2, v4, v5}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string/jumbo v2, "currts"

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzks;->zzcuj:J

    invoke-virtual {v0, v2, v4, v5}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string/jumbo v2, "seq_num"

    invoke-virtual {v0, v2, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string/jumbo v2, "preqs"

    iget v3, p0, Lcom/google/android/gms/internal/zzks;->zzcul:I

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string/jumbo v2, "preqs_in_session"

    iget v3, p0, Lcom/google/android/gms/internal/zzks;->zzcui:I

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string/jumbo v2, "pclick"

    iget v3, p0, Lcom/google/android/gms/internal/zzks;->zzcum:I

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string/jumbo v2, "pimp"

    iget v3, p0, Lcom/google/android/gms/internal/zzks;->zzcun:I

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string/jumbo v2, "support_transparent_background"

    invoke-static {p1}, Lcom/google/android/gms/internal/zzks;->zzx(Landroid/content/Context;)Z

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzug()V
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzks;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget v0, p0, Lcom/google/android/gms/internal/zzks;->zzcun:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzks;->zzcun:I

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzuh()V
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzks;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget v0, p0, Lcom/google/android/gms/internal/zzks;->zzcum:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzks;->zzcum:I

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzvd()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/zzks;->zzcui:I

    return v0
.end method

.method public zzvk()J
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/internal/zzks;->zzcuk:J

    return-wide v0
.end method
