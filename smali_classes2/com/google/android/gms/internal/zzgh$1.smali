.class Lcom/google/android/gms/internal/zzgh$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzgh;->zza(Lcom/google/android/gms/internal/zzav;)Lcom/google/android/gms/internal/zzgh$zzd;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzbtu:Lcom/google/android/gms/internal/zzav;

.field final synthetic zzbtv:Lcom/google/android/gms/internal/zzgh$zzd;

.field final synthetic zzbtw:Lcom/google/android/gms/internal/zzgh;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzgh;Lcom/google/android/gms/internal/zzav;Lcom/google/android/gms/internal/zzgh$zzd;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgh$1;->zzbtw:Lcom/google/android/gms/internal/zzgh;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzgh$1;->zzbtu:Lcom/google/android/gms/internal/zzav;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzgh$1;->zzbtv:Lcom/google/android/gms/internal/zzgh$zzd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgh$1;->zzbtw:Lcom/google/android/gms/internal/zzgh;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgh$1;->zzbtw:Lcom/google/android/gms/internal/zzgh;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzgh;->zza(Lcom/google/android/gms/internal/zzgh;)Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgh$1;->zzbtw:Lcom/google/android/gms/internal/zzgh;

    invoke-static {v2}, Lcom/google/android/gms/internal/zzgh;->zzb(Lcom/google/android/gms/internal/zzgh;)Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/internal/zzgh$1;->zzbtu:Lcom/google/android/gms/internal/zzav;

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/gms/internal/zzgh;->zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/internal/zzav;)Lcom/google/android/gms/internal/zzge;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/internal/zzgh$1$1;

    invoke-direct {v1, p0, v0}, Lcom/google/android/gms/internal/zzgh$1$1;-><init>(Lcom/google/android/gms/internal/zzgh$1;Lcom/google/android/gms/internal/zzge;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzge;->zza(Lcom/google/android/gms/internal/zzge$zza;)V

    const-string/jumbo v1, "/jsLoaded"

    new-instance v2, Lcom/google/android/gms/internal/zzgh$1$2;

    invoke-direct {v2, p0, v0}, Lcom/google/android/gms/internal/zzgh$1$2;-><init>(Lcom/google/android/gms/internal/zzgh$1;Lcom/google/android/gms/internal/zzge;)V

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/internal/zzge;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    new-instance v1, Lcom/google/android/gms/internal/zzln;

    invoke-direct {v1}, Lcom/google/android/gms/internal/zzln;-><init>()V

    new-instance v2, Lcom/google/android/gms/internal/zzgh$1$3;

    invoke-direct {v2, p0, v0, v1}, Lcom/google/android/gms/internal/zzgh$1$3;-><init>(Lcom/google/android/gms/internal/zzgh$1;Lcom/google/android/gms/internal/zzge;Lcom/google/android/gms/internal/zzln;)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzln;->set(Ljava/lang/Object;)V

    const-string/jumbo v1, "/requestReload"

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/internal/zzge;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgh$1;->zzbtw:Lcom/google/android/gms/internal/zzgh;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzgh;->zzf(Lcom/google/android/gms/internal/zzgh;)Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, ".js"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgh$1;->zzbtw:Lcom/google/android/gms/internal/zzgh;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzgh;->zzf(Lcom/google/android/gms/internal/zzgh;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzge;->zzbo(Ljava/lang/String;)V

    :goto_0
    sget-object v1, Lcom/google/android/gms/internal/zzlb;->zzcvl:Landroid/os/Handler;

    new-instance v2, Lcom/google/android/gms/internal/zzgh$1$4;

    invoke-direct {v2, p0, v0}, Lcom/google/android/gms/internal/zzgh$1$4;-><init>(Lcom/google/android/gms/internal/zzgh$1;Lcom/google/android/gms/internal/zzge;)V

    sget v0, Lcom/google/android/gms/internal/zzgh$zza;->zzbue:I

    int-to-long v4, v0

    invoke-virtual {v1, v2, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgh$1;->zzbtw:Lcom/google/android/gms/internal/zzgh;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzgh;->zzf(Lcom/google/android/gms/internal/zzgh;)Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "<html>"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgh$1;->zzbtw:Lcom/google/android/gms/internal/zzgh;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzgh;->zzf(Lcom/google/android/gms/internal/zzgh;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzge;->zzbq(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgh$1;->zzbtw:Lcom/google/android/gms/internal/zzgh;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzgh;->zzf(Lcom/google/android/gms/internal/zzgh;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzge;->zzbp(Ljava/lang/String;)V

    goto :goto_0
.end method
