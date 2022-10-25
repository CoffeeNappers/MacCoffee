.class Lcom/google/android/gms/internal/zzajs$17$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzajs$17;->zza(Lcom/google/android/gms/internal/zzall;Lcom/google/android/gms/internal/zzakb;Lcom/google/android/gms/internal/zzaix;Lcom/google/android/gms/internal/zzaka$zza;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic bep:Lcom/google/android/gms/internal/zzall;

.field final synthetic beq:Lcom/google/android/gms/internal/zzaka$zza;

.field final synthetic ber:Lcom/google/android/gms/internal/zzajs$17;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzajs$17;Lcom/google/android/gms/internal/zzall;Lcom/google/android/gms/internal/zzaka$zza;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzajs$17$1;->ber:Lcom/google/android/gms/internal/zzajs$17;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzajs$17$1;->bep:Lcom/google/android/gms/internal/zzall;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzajs$17$1;->beq:Lcom/google/android/gms/internal/zzaka$zza;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs$17$1;->ber:Lcom/google/android/gms/internal/zzajs$17;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzajs$17;->bdZ:Lcom/google/android/gms/internal/zzajs;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajs;->zzd(Lcom/google/android/gms/internal/zzajs;)Lcom/google/android/gms/internal/zzajx;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs$17$1;->bep:Lcom/google/android/gms/internal/zzall;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzajx;->zzq(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs$17$1;->ber:Lcom/google/android/gms/internal/zzajs$17;

    iget-object v1, v1, Lcom/google/android/gms/internal/zzajs$17;->bdZ:Lcom/google/android/gms/internal/zzajs;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzajs;->zze(Lcom/google/android/gms/internal/zzajs;)Lcom/google/android/gms/internal/zzaka;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzajs$17$1;->bep:Lcom/google/android/gms/internal/zzall;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/internal/zzaka;->zzi(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs$17$1;->ber:Lcom/google/android/gms/internal/zzajs$17;

    iget-object v1, v1, Lcom/google/android/gms/internal/zzajs$17;->bdZ:Lcom/google/android/gms/internal/zzajs;

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/zzajs;->zza(Lcom/google/android/gms/internal/zzajs;Ljava/util/List;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs$17$1;->beq:Lcom/google/android/gms/internal/zzaka$zza;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzaka$zza;->zzb(Lcom/google/firebase/database/DatabaseError;)Ljava/util/List;

    :cond_0
    return-void
.end method
