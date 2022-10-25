.class Lcom/google/android/gms/internal/zzgh$1$3;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzfe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzgh$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzbtx:Lcom/google/android/gms/internal/zzge;

.field final synthetic zzbty:Lcom/google/android/gms/internal/zzgh$1;

.field final synthetic zzbub:Lcom/google/android/gms/internal/zzln;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzgh$1;Lcom/google/android/gms/internal/zzge;Lcom/google/android/gms/internal/zzln;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgh$1$3;->zzbty:Lcom/google/android/gms/internal/zzgh$1;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzgh$1$3;->zzbtx:Lcom/google/android/gms/internal/zzge;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzgh$1$3;->zzbub:Lcom/google/android/gms/internal/zzln;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzmd;Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzmd;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgh$1$3;->zzbty:Lcom/google/android/gms/internal/zzgh$1;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzgh$1;->zzbtw:Lcom/google/android/gms/internal/zzgh;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzgh;->zzc(Lcom/google/android/gms/internal/zzgh;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    :try_start_0
    const-string/jumbo v0, "JS Engine is requesting an update"

    invoke-static {v0}, Lcom/google/android/gms/internal/zzkx;->zzdh(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgh$1$3;->zzbty:Lcom/google/android/gms/internal/zzgh$1;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzgh$1;->zzbtw:Lcom/google/android/gms/internal/zzgh;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzgh;->zze(Lcom/google/android/gms/internal/zzgh;)I

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "Starting reload."

    invoke-static {v0}, Lcom/google/android/gms/internal/zzkx;->zzdh(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgh$1$3;->zzbty:Lcom/google/android/gms/internal/zzgh$1;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzgh$1;->zzbtw:Lcom/google/android/gms/internal/zzgh;

    const/4 v2, 0x2

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/zzgh;->zza(Lcom/google/android/gms/internal/zzgh;I)I

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgh$1$3;->zzbty:Lcom/google/android/gms/internal/zzgh$1;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzgh$1;->zzbtw:Lcom/google/android/gms/internal/zzgh;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgh$1$3;->zzbty:Lcom/google/android/gms/internal/zzgh$1;

    iget-object v2, v2, Lcom/google/android/gms/internal/zzgh$1;->zzbtu:Lcom/google/android/gms/internal/zzav;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/zzgh;->zzb(Lcom/google/android/gms/internal/zzav;)Lcom/google/android/gms/internal/zzgh$zzd;

    :cond_0
    iget-object v2, p0, Lcom/google/android/gms/internal/zzgh$1$3;->zzbtx:Lcom/google/android/gms/internal/zzge;

    const-string/jumbo v3, "/requestReload"

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgh$1$3;->zzbub:Lcom/google/android/gms/internal/zzln;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzln;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzfe;

    invoke-interface {v2, v3, v0}, Lcom/google/android/gms/internal/zzge;->zzb(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
