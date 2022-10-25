.class Lcom/google/android/gms/internal/zzajs$4;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzajy$zzb;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzajs;->zzcvt()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic bdZ:Lcom/google/android/gms/internal/zzajs;

.field final synthetic bed:Ljava/util/List;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzajs;Ljava/util/List;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzajs$4;->bdZ:Lcom/google/android/gms/internal/zzajs;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzajs$4;->bed:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzf(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs$4;->bed:Ljava/util/List;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs$4;->bdZ:Lcom/google/android/gms/internal/zzajs;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzajs;->zzg(Lcom/google/android/gms/internal/zzajs;)Lcom/google/android/gms/internal/zzaka;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Lcom/google/android/gms/internal/zzaka;->zzi(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs$4;->bdZ:Lcom/google/android/gms/internal/zzajs;

    const/16 v1, -0x9

    invoke-static {v0, p1, v1}, Lcom/google/android/gms/internal/zzajs;->zza(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;I)Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs$4;->bdZ:Lcom/google/android/gms/internal/zzajs;

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/zzajs;->zzb(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzajq;

    return-void
.end method
