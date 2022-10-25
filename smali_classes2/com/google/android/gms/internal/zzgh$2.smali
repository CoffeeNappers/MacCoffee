.class Lcom/google/android/gms/internal/zzgh$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzlw$zzc;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzgh;->zzb(Lcom/google/android/gms/internal/zzav;)Lcom/google/android/gms/internal/zzgh$zzd;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/internal/zzlw$zzc",
        "<",
        "Lcom/google/android/gms/internal/zzge;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic zzbtw:Lcom/google/android/gms/internal/zzgh;

.field final synthetic zzbud:Lcom/google/android/gms/internal/zzgh$zzd;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzgh;Lcom/google/android/gms/internal/zzgh$zzd;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgh$2;->zzbtw:Lcom/google/android/gms/internal/zzgh;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzgh$2;->zzbud:Lcom/google/android/gms/internal/zzgh$zzd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzge;)V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgh$2;->zzbtw:Lcom/google/android/gms/internal/zzgh;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzgh;->zzc(Lcom/google/android/gms/internal/zzgh;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgh$2;->zzbtw:Lcom/google/android/gms/internal/zzgh;

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/zzgh;->zza(Lcom/google/android/gms/internal/zzgh;I)I

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgh$2;->zzbtw:Lcom/google/android/gms/internal/zzgh;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzgh;->zzg(Lcom/google/android/gms/internal/zzgh;)Lcom/google/android/gms/internal/zzgh$zzd;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgh$2;->zzbud:Lcom/google/android/gms/internal/zzgh$zzd;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgh$2;->zzbtw:Lcom/google/android/gms/internal/zzgh;

    invoke-static {v2}, Lcom/google/android/gms/internal/zzgh;->zzg(Lcom/google/android/gms/internal/zzgh;)Lcom/google/android/gms/internal/zzgh$zzd;

    move-result-object v2

    if-eq v0, v2, :cond_0

    const-string/jumbo v0, "New JS engine is loaded, marking previous one as destroyable."

    invoke-static {v0}, Lcom/google/android/gms/internal/zzkx;->v(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgh$2;->zzbtw:Lcom/google/android/gms/internal/zzgh;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzgh;->zzg(Lcom/google/android/gms/internal/zzgh;)Lcom/google/android/gms/internal/zzgh$zzd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzgh$zzd;->zzob()V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgh$2;->zzbtw:Lcom/google/android/gms/internal/zzgh;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgh$2;->zzbud:Lcom/google/android/gms/internal/zzgh$zzd;

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/zzgh;->zza(Lcom/google/android/gms/internal/zzgh;Lcom/google/android/gms/internal/zzgh$zzd;)Lcom/google/android/gms/internal/zzgh$zzd;

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public synthetic zzd(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/internal/zzge;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzgh$2;->zza(Lcom/google/android/gms/internal/zzge;)V

    return-void
.end method
