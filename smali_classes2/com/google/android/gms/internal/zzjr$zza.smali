.class public final Lcom/google/android/gms/internal/zzjr$zza;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzjr;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "zza"
.end annotation


# instance fields
.field private zzavd:F

.field private zzcke:I

.field private zzckf:I

.field private zzcps:I

.field private zzcpt:Z

.field private zzcpu:Z

.field private zzcpv:Ljava/lang/String;

.field private zzcpw:Ljava/lang/String;

.field private zzcpx:Z

.field private zzcpy:Z

.field private zzcpz:Z

.field private zzcqa:Z

.field private zzcqb:Ljava/lang/String;

.field private zzcqc:Ljava/lang/String;

.field private zzcqd:I

.field private zzcqe:I

.field private zzcqf:I

.field private zzcqg:I

.field private zzcqh:I

.field private zzcqi:I

.field private zzcqj:D

.field private zzcqk:Z

.field private zzcql:Z

.field private zzcqm:I

.field private zzcqn:Ljava/lang/String;

.field private zzcqo:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 5

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzjr$zza;->zzs(Landroid/content/Context;)V

    invoke-direct {p0, p1, v3}, Lcom/google/android/gms/internal/zzjr$zza;->zza(Landroid/content/Context;Landroid/content/pm/PackageManager;)V

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzjr$zza;->zzt(Landroid/content/Context;)V

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    const-string/jumbo v0, "geo:0,0?q=donuts"

    invoke-static {v3, v0}, Lcom/google/android/gms/internal/zzjr$zza;->zza(Landroid/content/pm/PackageManager;Ljava/lang/String;)Landroid/content/pm/ResolveInfo;

    move-result-object v0

    if-eqz v0, :cond_1

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcpt:Z

    const-string/jumbo v0, "http://www.google.com"

    invoke-static {v3, v0}, Lcom/google/android/gms/internal/zzjr$zza;->zza(Landroid/content/pm/PackageManager;Ljava/lang/String;)Landroid/content/pm/ResolveInfo;

    move-result-object v0

    if-eqz v0, :cond_2

    :goto_1
    iput-boolean v1, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcpu:Z

    invoke-virtual {v4}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcpw:Ljava/lang/String;

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzm;->zzkr()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzwp()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcpx:Z

    invoke-static {p1}, Lcom/google/android/gms/common/util/zzi;->zzcj(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcpy:Z

    invoke-virtual {v4}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqb:Ljava/lang/String;

    invoke-static {v3}, Lcom/google/android/gms/internal/zzjr$zza;->zza(Landroid/content/pm/PackageManager;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqc:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    if-nez v0, :cond_3

    :cond_0
    :goto_2
    return-void

    :cond_1
    move v0, v2

    goto :goto_0

    :cond_2
    move v1, v2

    goto :goto_1

    :cond_3
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    if-eqz v0, :cond_0

    iget v1, v0, Landroid/util/DisplayMetrics;->density:F

    iput v1, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzavd:F

    iget v1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iput v1, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcke:I

    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    iput v0, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzckf:I

    goto :goto_2
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzjr;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzjr$zza;->zzs(Landroid/content/Context;)V

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/zzjr$zza;->zza(Landroid/content/Context;Landroid/content/pm/PackageManager;)V

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzjr$zza;->zzt(Landroid/content/Context;)V

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzjr$zza;->zzu(Landroid/content/Context;)V

    iget-boolean v0, p2, Lcom/google/android/gms/internal/zzjr;->zzcpt:Z

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcpt:Z

    iget-boolean v0, p2, Lcom/google/android/gms/internal/zzjr;->zzcpu:Z

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcpu:Z

    iget-object v0, p2, Lcom/google/android/gms/internal/zzjr;->zzcpw:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcpw:Ljava/lang/String;

    iget-boolean v0, p2, Lcom/google/android/gms/internal/zzjr;->zzcpx:Z

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcpx:Z

    iget-boolean v0, p2, Lcom/google/android/gms/internal/zzjr;->zzcpy:Z

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcpy:Z

    iget-object v0, p2, Lcom/google/android/gms/internal/zzjr;->zzcqb:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqb:Ljava/lang/String;

    iget-object v0, p2, Lcom/google/android/gms/internal/zzjr;->zzcqc:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqc:Ljava/lang/String;

    iget v0, p2, Lcom/google/android/gms/internal/zzjr;->zzavd:F

    iput v0, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzavd:F

    iget v0, p2, Lcom/google/android/gms/internal/zzjr;->zzcke:I

    iput v0, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcke:I

    iget v0, p2, Lcom/google/android/gms/internal/zzjr;->zzckf:I

    iput v0, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzckf:I

    return-void
.end method

.method private static zza(Landroid/content/pm/PackageManager;Ljava/lang/String;)Landroid/content/pm/ResolveInfo;
    .locals 3

    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.VIEW"

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/high16 v1, 0x10000

    invoke-virtual {p0, v0, v1}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v0

    return-object v0
.end method

.method private static zza(Landroid/content/pm/PackageManager;)Ljava/lang/String;
    .locals 5

    const/4 v0, 0x0

    const-string/jumbo v1, "market://details?id=com.google.android.gms.ads"

    invoke-static {p0, v1}, Lcom/google/android/gms/internal/zzjr$zza;->zza(Landroid/content/pm/PackageManager;Ljava/lang/String;)Landroid/content/pm/ResolveInfo;

    move-result-object v1

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return-object v0

    :cond_1
    iget-object v1, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    if-eqz v1, :cond_0

    :try_start_0
    iget-object v2, v1, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    if-eqz v2, :cond_0

    iget v2, v2, Landroid/content/pm/PackageInfo;->versionCode:I

    iget-object v1, v1, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0xc

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private zza(Landroid/content/Context;Landroid/content/pm/PackageManager;)V
    .locals 5
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    const/4 v4, -0x1

    const-string/jumbo v0, "phone"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    const-string/jumbo v1, "connectivity"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getNetworkOperator()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcpv:Ljava/lang/String;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getNetworkType()I

    move-result v2

    iput v2, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqf:I

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getPhoneType()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqg:I

    const/4 v0, -0x2

    iput v0, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqe:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcql:Z

    iput v4, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqm:I

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgm()Lcom/google/android/gms/internal/zzlb;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "android.permission.ACCESS_NETWORK_STATE"

    invoke-virtual {v0, p2, v2, v3}, Lcom/google/android/gms/internal/zzlb;->zza(Landroid/content/pm/PackageManager;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v2

    iput v2, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqe:I

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getDetailedState()Landroid/net/NetworkInfo$DetailedState;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/NetworkInfo$DetailedState;->ordinal()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqm:I

    :goto_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x10

    if-lt v0, v2, :cond_0

    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->isActiveNetworkMetered()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcql:Z

    :cond_0
    return-void

    :cond_1
    iput v4, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqe:I

    goto :goto_0
.end method

.method private zzs(Landroid/content/Context;)V
    .locals 4

    const/4 v3, 0x0

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgm()Lcom/google/android/gms/internal/zzlb;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzlb;->zzag(Landroid/content/Context;)Landroid/media/AudioManager;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    invoke-virtual {v0}, Landroid/media/AudioManager;->getMode()I

    move-result v1

    iput v1, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcps:I

    invoke-virtual {v0}, Landroid/media/AudioManager;->isMusicActive()Z

    move-result v1

    iput-boolean v1, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcpz:Z

    invoke-virtual {v0}, Landroid/media/AudioManager;->isSpeakerphoneOn()Z

    move-result v1

    iput-boolean v1, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqa:Z

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v1

    iput v1, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqd:I

    invoke-virtual {v0}, Landroid/media/AudioManager;->getRingerMode()I

    move-result v1

    iput v1, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqh:I

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqi:I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgq()Lcom/google/android/gms/internal/zzkr;

    move-result-object v1

    const-string/jumbo v2, "DeviceInfo.gatherAudioInfo"

    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/internal/zzkr;->zza(Ljava/lang/Throwable;Ljava/lang/String;)V

    :cond_0
    const/4 v0, -0x2

    iput v0, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcps:I

    iput-boolean v3, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcpz:Z

    iput-boolean v3, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqa:Z

    iput v3, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqd:I

    iput v3, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqh:I

    iput v3, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqi:I

    goto :goto_0
.end method

.method private zzt(Landroid/content/Context;)V
    .locals 6

    const/4 v0, 0x0

    const/4 v5, -0x1

    new-instance v1, Landroid/content/IntentFilter;

    const-string/jumbo v2, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v1

    if-eqz v1, :cond_2

    const-string/jumbo v2, "status"

    invoke-virtual {v1, v2, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    const-string/jumbo v3, "level"

    invoke-virtual {v1, v3, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    const-string/jumbo v4, "scale"

    invoke-virtual {v1, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    int-to-float v3, v3

    int-to-float v1, v1

    div-float v1, v3, v1

    float-to-double v4, v1

    iput-wide v4, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqj:D

    const/4 v1, 0x2

    if-eq v2, v1, :cond_0

    const/4 v1, 0x5

    if-ne v2, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :cond_1
    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqk:Z

    :goto_0
    return-void

    :cond_2
    const-wide/high16 v2, -0x4010000000000000L    # -1.0

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqj:D

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqk:Z

    goto :goto_0
.end method

.method private zzu(Landroid/content/Context;)V
    .locals 1

    sget-object v0, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqn:Ljava/lang/String;

    invoke-static {p1}, Lcom/google/android/gms/internal/zzef;->zzn(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqo:Z

    return-void
.end method


# virtual methods
.method public zztr()Lcom/google/android/gms/internal/zzjr;
    .locals 31

    new-instance v3, Lcom/google/android/gms/internal/zzjr;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/android/gms/internal/zzjr$zza;->zzcps:I

    move-object/from16 v0, p0

    iget-boolean v5, v0, Lcom/google/android/gms/internal/zzjr$zza;->zzcpt:Z

    move-object/from16 v0, p0

    iget-boolean v6, v0, Lcom/google/android/gms/internal/zzjr$zza;->zzcpu:Z

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/google/android/gms/internal/zzjr$zza;->zzcpv:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/google/android/gms/internal/zzjr$zza;->zzcpw:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-boolean v9, v0, Lcom/google/android/gms/internal/zzjr$zza;->zzcpx:Z

    move-object/from16 v0, p0

    iget-boolean v10, v0, Lcom/google/android/gms/internal/zzjr$zza;->zzcpy:Z

    move-object/from16 v0, p0

    iget-boolean v11, v0, Lcom/google/android/gms/internal/zzjr$zza;->zzcpz:Z

    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqa:Z

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqb:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqc:Ljava/lang/String;

    move-object/from16 v0, p0

    iget v15, v0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqd:I

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqe:I

    move/from16 v16, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqf:I

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqg:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqh:I

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqi:I

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/gms/internal/zzjr$zza;->zzavd:F

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/gms/internal/zzjr$zza;->zzcke:I

    move/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/gms/internal/zzjr$zza;->zzckf:I

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqj:D

    move-wide/from16 v24, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqk:Z

    move/from16 v26, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/google/android/gms/internal/zzjr$zza;->zzcql:Z

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqm:I

    move/from16 v28, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqn:Ljava/lang/String;

    move-object/from16 v29, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/google/android/gms/internal/zzjr$zza;->zzcqo:Z

    move/from16 v30, v0

    invoke-direct/range {v3 .. v30}, Lcom/google/android/gms/internal/zzjr;-><init>(IZZLjava/lang/String;Ljava/lang/String;ZZZZLjava/lang/String;Ljava/lang/String;IIIIIIFIIDZZILjava/lang/String;Z)V

    return-object v3
.end method
