.class Lcom/google/android/gms/internal/zzaie$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/firebase/FirebaseApp$zzb;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzaie;->zza(Lcom/google/android/gms/internal/zzajj;Lcom/google/android/gms/internal/zzaiu;Lcom/google/android/gms/internal/zzaiw;Lcom/google/android/gms/internal/zzaiy$zza;)Lcom/google/android/gms/internal/zzaiy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic aZM:Lcom/google/android/gms/internal/zzaie;

.field final synthetic aZP:Lcom/google/android/gms/internal/zzaiy;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzaie;Lcom/google/android/gms/internal/zzaiy;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaie$2;->aZM:Lcom/google/android/gms/internal/zzaie;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzaie$2;->aZP:Lcom/google/android/gms/internal/zzaiy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzcr(Z)V
    .locals 2

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaie$2;->aZP:Lcom/google/android/gms/internal/zzaiy;

    const-string/jumbo v1, "app_in_background"

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzaiy;->interrupt(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaie$2;->aZP:Lcom/google/android/gms/internal/zzaiy;

    const-string/jumbo v1, "app_in_background"

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzaiy;->resume(Ljava/lang/String;)V

    goto :goto_0
.end method
