.class Lcom/google/android/gms/internal/zzaiz$5;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzaiz$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzaiz;->zzb(Lcom/google/android/gms/internal/zzaiz$zze;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic bbC:Lcom/google/android/gms/internal/zzaiz$zze;

.field final synthetic bbv:Lcom/google/android/gms/internal/zzaiz;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzaiz;Lcom/google/android/gms/internal/zzaiz$zze;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaiz$5;->bbv:Lcom/google/android/gms/internal/zzaiz;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzaiz$5;->bbC:Lcom/google/android/gms/internal/zzaiz$zze;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzbz(Ljava/util/Map;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    const/4 v4, 0x0

    const-string/jumbo v0, "s"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string/jumbo v1, "ok"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string/jumbo v1, "d"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    const-string/jumbo v2, "w"

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string/jumbo v2, "w"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaiz$5;->bbv:Lcom/google/android/gms/internal/zzaiz;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzaiz$5;->bbC:Lcom/google/android/gms/internal/zzaiz$zze;

    invoke-static {v3}, Lcom/google/android/gms/internal/zzaiz$zze;->zzc(Lcom/google/android/gms/internal/zzaiz$zze;)Lcom/google/android/gms/internal/zzaiz$zzc;

    move-result-object v3

    invoke-static {v2, v1, v3}, Lcom/google/android/gms/internal/zzaiz;->zza(Lcom/google/android/gms/internal/zzaiz;Ljava/util/List;Lcom/google/android/gms/internal/zzaiz$zzc;)V

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzaiz$5;->bbv:Lcom/google/android/gms/internal/zzaiz;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzaiz;->zzo(Lcom/google/android/gms/internal/zzaiz;)Ljava/util/Map;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaiz$5;->bbC:Lcom/google/android/gms/internal/zzaiz$zze;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzaiz$zze;->zzctg()Lcom/google/android/gms/internal/zzaiz$zzc;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzaiz$zze;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaiz$5;->bbC:Lcom/google/android/gms/internal/zzaiz$zze;

    if-ne v1, v2, :cond_1

    const-string/jumbo v1, "ok"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaiz$5;->bbv:Lcom/google/android/gms/internal/zzaiz;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaiz$5;->bbC:Lcom/google/android/gms/internal/zzaiz$zze;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzaiz$zze;->zzctg()Lcom/google/android/gms/internal/zzaiz$zzc;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzaiz;->zza(Lcom/google/android/gms/internal/zzaiz;Lcom/google/android/gms/internal/zzaiz$zzc;)Lcom/google/android/gms/internal/zzaiz$zze;

    const-string/jumbo v1, "d"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaiz$5;->bbC:Lcom/google/android/gms/internal/zzaiz$zze;

    invoke-static {v2}, Lcom/google/android/gms/internal/zzaiz$zze;->zzd(Lcom/google/android/gms/internal/zzaiz$zze;)Lcom/google/android/gms/internal/zzajb;

    move-result-object v2

    invoke-interface {v2, v0, v1}, Lcom/google/android/gms/internal/zzajb;->zzbn(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz$5;->bbC:Lcom/google/android/gms/internal/zzaiz$zze;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaiz$zze;->zzd(Lcom/google/android/gms/internal/zzaiz$zze;)Lcom/google/android/gms/internal/zzajb;

    move-result-object v0

    invoke-interface {v0, v4, v4}, Lcom/google/android/gms/internal/zzajb;->zzbn(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
