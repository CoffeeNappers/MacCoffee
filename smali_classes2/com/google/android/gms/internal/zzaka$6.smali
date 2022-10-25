.class Lcom/google/android/gms/internal/zzaka$6;
.super Lcom/google/android/gms/internal/zzaim$zzb;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzaka;->zzb(Lcom/google/android/gms/internal/zzakn;Lcom/google/android/gms/internal/zzakz;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzaki;)Ljava/util/List;
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
        "Lcom/google/android/gms/internal/zzakz",
        "<",
        "Lcom/google/android/gms/internal/zzajz;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic bed:Ljava/util/List;

.field final synthetic bfr:Lcom/google/android/gms/internal/zzaka;

.field final synthetic bfw:Lcom/google/android/gms/internal/zzaml;

.field final synthetic bfx:Lcom/google/android/gms/internal/zzaki;

.field final synthetic bfy:Lcom/google/android/gms/internal/zzakn;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzaki;Lcom/google/android/gms/internal/zzakn;Ljava/util/List;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaka$6;->bfr:Lcom/google/android/gms/internal/zzaka;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzaka$6;->bfw:Lcom/google/android/gms/internal/zzaml;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzaka$6;->bfx:Lcom/google/android/gms/internal/zzaki;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzaka$6;->bfy:Lcom/google/android/gms/internal/zzakn;

    iput-object p5, p0, Lcom/google/android/gms/internal/zzaka$6;->bed:Ljava/util/List;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaim$zzb;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzakz;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzalz;",
            "Lcom/google/android/gms/internal/zzakz",
            "<",
            "Lcom/google/android/gms/internal/zzajz;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaka$6;->bfw:Lcom/google/android/gms/internal/zzaml;

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka$6;->bfw:Lcom/google/android/gms/internal/zzaml;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/zzaml;->zzm(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzaka$6;->bfx:Lcom/google/android/gms/internal/zzaki;

    invoke-virtual {v1, p1}, Lcom/google/android/gms/internal/zzaki;->zzb(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzaki;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaka$6;->bfy:Lcom/google/android/gms/internal/zzakn;

    invoke-virtual {v2, p1}, Lcom/google/android/gms/internal/zzakn;->zzc(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzakn;

    move-result-object v2

    if-eqz v2, :cond_1

    iget-object v3, p0, Lcom/google/android/gms/internal/zzaka$6;->bed:Ljava/util/List;

    iget-object v4, p0, Lcom/google/android/gms/internal/zzaka$6;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v4, v2, p2, v0, v1}, Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzakn;Lcom/google/android/gms/internal/zzakz;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzaki;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v3, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_1
    return-void
.end method

.method public synthetic zzk(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/internal/zzalz;

    check-cast p2, Lcom/google/android/gms/internal/zzakz;

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/zzaka$6;->zza(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzakz;)V

    return-void
.end method
