.class Lcom/google/android/gms/internal/zzajs$12;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzajf$zzb;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzajs;->zzcvo()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic bdZ:Lcom/google/android/gms/internal/zzajs;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzajs;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzajs$12;->bdZ:Lcom/google/android/gms/internal/zzajs;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzsr(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs$12;->bdZ:Lcom/google/android/gms/internal/zzajs;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajs;->zzb(Lcom/google/android/gms/internal/zzajs;)Lcom/google/android/gms/internal/zzalw;

    move-result-object v0

    const-string/jumbo v1, "Auth token changed, triggering auth token refresh"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs$12;->bdZ:Lcom/google/android/gms/internal/zzajs;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajs;->zzc(Lcom/google/android/gms/internal/zzajs;)Lcom/google/android/gms/internal/zzaiy;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/zzaiy;->zzsk(Ljava/lang/String;)V

    return-void
.end method
