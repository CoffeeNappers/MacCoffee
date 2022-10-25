.class public Lcom/google/android/gms/internal/zzht;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzji;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzht$zza;
    }
.end annotation


# instance fields
.field private final zzbyw:Z

.field private final zzbyx:Z

.field private final zzbyy:Z

.field private final zzbyz:Z

.field private final zzbza:Z


# direct methods
.method private constructor <init>(Lcom/google/android/gms/internal/zzht$zza;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/google/android/gms/internal/zzht$zza;->zza(Lcom/google/android/gms/internal/zzht$zza;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzht;->zzbyw:Z

    invoke-static {p1}, Lcom/google/android/gms/internal/zzht$zza;->zzb(Lcom/google/android/gms/internal/zzht$zza;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzht;->zzbyx:Z

    invoke-static {p1}, Lcom/google/android/gms/internal/zzht$zza;->zzc(Lcom/google/android/gms/internal/zzht$zza;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzht;->zzbyy:Z

    invoke-static {p1}, Lcom/google/android/gms/internal/zzht$zza;->zzd(Lcom/google/android/gms/internal/zzht$zza;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzht;->zzbyz:Z

    invoke-static {p1}, Lcom/google/android/gms/internal/zzht$zza;->zze(Lcom/google/android/gms/internal/zzht$zza;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzht;->zzbza:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/internal/zzht$zza;Lcom/google/android/gms/internal/zzht$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzht;-><init>(Lcom/google/android/gms/internal/zzht$zza;)V

    return-void
.end method


# virtual methods
.method public toJson()Lorg/json/JSONObject;
    .locals 3

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string/jumbo v1, "sms"

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzht;->zzbyw:Z

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v0

    const-string/jumbo v1, "tel"

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzht;->zzbyx:Z

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v0

    const-string/jumbo v1, "calendar"

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzht;->zzbyy:Z

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v0

    const-string/jumbo v1, "storePicture"

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzht;->zzbyz:Z

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v0

    const-string/jumbo v1, "inlineVideo"

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzht;->zzbza:Z

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    const-string/jumbo v1, "Error occured while obtaining the MRAID capabilities."

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/zzkx;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x0

    goto :goto_0
.end method
