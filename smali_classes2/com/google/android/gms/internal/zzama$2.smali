.class Lcom/google/android/gms/internal/zzama$2;
.super Lcom/google/android/gms/internal/zzaim$zzb;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzama;->zza(Lcom/google/android/gms/internal/zzama$zza;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/zzaim$zzb",
        "<",
        "Lcom/google/android/gms/internal/zzalz;",
        "Lcom/google/android/gms/internal/zzaml;",
        ">;"
    }
.end annotation


# instance fields
.field biB:Z

.field final synthetic biC:Lcom/google/android/gms/internal/zzama$zza;

.field final synthetic biD:Lcom/google/android/gms/internal/zzama;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzama;Lcom/google/android/gms/internal/zzama$zza;)V
    .locals 1

    iput-object p1, p0, Lcom/google/android/gms/internal/zzama$2;->biD:Lcom/google/android/gms/internal/zzama;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzama$2;->biC:Lcom/google/android/gms/internal/zzama$zza;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaim$zzb;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzama$2;->biB:Z

    return-void
.end method


# virtual methods
.method public zzf(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)V
    .locals 3

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzama$2;->biB:Z

    if-nez v0, :cond_0

    invoke-static {}, Lcom/google/android/gms/internal/zzalz;->zzcyz()Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzalz;->zzi(Lcom/google/android/gms/internal/zzalz;)I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzama$2;->biB:Z

    iget-object v0, p0, Lcom/google/android/gms/internal/zzama$2;->biC:Lcom/google/android/gms/internal/zzama$zza;

    invoke-static {}, Lcom/google/android/gms/internal/zzalz;->zzcyz()Lcom/google/android/gms/internal/zzalz;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzama$2;->biD:Lcom/google/android/gms/internal/zzama;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzama;->zzczf()Lcom/google/android/gms/internal/zzaml;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzama$zza;->zzb(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzama$2;->biC:Lcom/google/android/gms/internal/zzama$zza;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/internal/zzama$zza;->zzb(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)V

    return-void
.end method

.method public synthetic zzk(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/internal/zzalz;

    check-cast p2, Lcom/google/android/gms/internal/zzaml;

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/zzama$2;->zzf(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)V

    return-void
.end method
