.class Lcom/google/android/gms/internal/zzaiz$4;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzaiz$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzaiz;->zzcd(J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic aUb:Ljava/lang/String;

.field final synthetic bbA:J

.field final synthetic bbB:Lcom/google/android/gms/internal/zzaiz$zzf;

.field final synthetic bbv:Lcom/google/android/gms/internal/zzaiz;

.field final synthetic bby:Lcom/google/android/gms/internal/zzajb;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzaiz;Ljava/lang/String;JLcom/google/android/gms/internal/zzaiz$zzf;Lcom/google/android/gms/internal/zzajb;)V
    .locals 1

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaiz$4;->bbv:Lcom/google/android/gms/internal/zzaiz;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzaiz$4;->aUb:Ljava/lang/String;

    iput-wide p3, p0, Lcom/google/android/gms/internal/zzaiz$4;->bbA:J

    iput-object p5, p0, Lcom/google/android/gms/internal/zzaiz$4;->bbB:Lcom/google/android/gms/internal/zzaiz$zzf;

    iput-object p6, p0, Lcom/google/android/gms/internal/zzaiz$4;->bby:Lcom/google/android/gms/internal/zzajb;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzbz(Ljava/util/Map;)V
    .locals 8
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

    const/4 v7, 0x0

    const/4 v6, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz$4;->bbv:Lcom/google/android/gms/internal/zzaiz;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaiz;->zza(Lcom/google/android/gms/internal/zzaiz;)Lcom/google/android/gms/internal/zzalw;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz$4;->bbv:Lcom/google/android/gms/internal/zzaiz;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaiz;->zza(Lcom/google/android/gms/internal/zzaiz;)Lcom/google/android/gms/internal/zzalw;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaiz$4;->aUb:Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0xb

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v4, v5

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v3, " response: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-array v2, v6, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz$4;->bbv:Lcom/google/android/gms/internal/zzaiz;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaiz;->zzm(Lcom/google/android/gms/internal/zzaiz;)Ljava/util/Map;

    move-result-object v0

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzaiz$4;->bbA:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaiz$zzf;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaiz$4;->bbB:Lcom/google/android/gms/internal/zzaiz$zzf;

    if-ne v0, v1, :cond_3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz$4;->bbv:Lcom/google/android/gms/internal/zzaiz;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaiz;->zzm(Lcom/google/android/gms/internal/zzaiz;)Ljava/util/Map;

    move-result-object v0

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzaiz$4;->bbA:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz$4;->bby:Lcom/google/android/gms/internal/zzajb;

    if-eqz v0, :cond_1

    const-string/jumbo v0, "s"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string/jumbo v1, "ok"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz$4;->bby:Lcom/google/android/gms/internal/zzajb;

    invoke-interface {v0, v7, v7}, Lcom/google/android/gms/internal/zzajb;->zzbn(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz$4;->bbv:Lcom/google/android/gms/internal/zzaiz;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaiz;->zzn(Lcom/google/android/gms/internal/zzaiz;)V

    return-void

    :cond_2
    const-string/jumbo v1, "d"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaiz$4;->bby:Lcom/google/android/gms/internal/zzajb;

    invoke-interface {v2, v0, v1}, Lcom/google/android/gms/internal/zzajb;->zzbn(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz$4;->bbv:Lcom/google/android/gms/internal/zzaiz;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaiz;->zza(Lcom/google/android/gms/internal/zzaiz;)Lcom/google/android/gms/internal/zzalw;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz$4;->bbv:Lcom/google/android/gms/internal/zzaiz;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaiz;->zza(Lcom/google/android/gms/internal/zzaiz;)Lcom/google/android/gms/internal/zzalw;

    move-result-object v0

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzaiz$4;->bbA:J

    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v4, 0x51

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v4, "Ignoring on complete for put "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " because it was removed already."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-array v2, v6, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method
