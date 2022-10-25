.class Lcom/google/android/gms/internal/zzjc$1$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzme$zzb;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzjc$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzaos:Lcom/google/android/gms/internal/zzmd;

.field final synthetic zzciw:Lcom/google/android/gms/internal/zzjc$1;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzjc$1;Lcom/google/android/gms/internal/zzmd;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzjc$1$1;->zzciw:Lcom/google/android/gms/internal/zzjc$1;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzjc$1$1;->zzaos:Lcom/google/android/gms/internal/zzmd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzk(Lcom/google/android/gms/internal/zzmd;)V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzjc$1$1;->zzaos:Lcom/google/android/gms/internal/zzmd;

    const-string/jumbo v1, "google.afma.nativeAds.renderVideo"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzjc$1$1;->zzciw:Lcom/google/android/gms/internal/zzjc$1;

    iget-object v2, v2, Lcom/google/android/gms/internal/zzjc$1;->zzcit:Lorg/json/JSONObject;

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/internal/zzmd;->zza(Ljava/lang/String;Lorg/json/JSONObject;)V

    return-void
.end method
