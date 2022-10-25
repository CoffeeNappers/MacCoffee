.class Lcom/google/android/gms/internal/zzgh$3;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzlw$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzgh;->zzb(Lcom/google/android/gms/internal/zzav;)Lcom/google/android/gms/internal/zzgh$zzd;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzbtw:Lcom/google/android/gms/internal/zzgh;

.field final synthetic zzbud:Lcom/google/android/gms/internal/zzgh$zzd;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzgh;Lcom/google/android/gms/internal/zzgh$zzd;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgh$3;->zzbtw:Lcom/google/android/gms/internal/zzgh;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzgh$3;->zzbud:Lcom/google/android/gms/internal/zzgh$zzd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgh$3;->zzbtw:Lcom/google/android/gms/internal/zzgh;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzgh;->zzc(Lcom/google/android/gms/internal/zzgh;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgh$3;->zzbtw:Lcom/google/android/gms/internal/zzgh;

    const/4 v2, 0x1

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/zzgh;->zza(Lcom/google/android/gms/internal/zzgh;I)I

    const-string/jumbo v0, "Failed loading new engine. Marking new engine destroyable."

    invoke-static {v0}, Lcom/google/android/gms/internal/zzkx;->v(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgh$3;->zzbud:Lcom/google/android/gms/internal/zzgh$zzd;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzgh$zzd;->zzob()V

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
