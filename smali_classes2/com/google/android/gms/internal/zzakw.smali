.class public Lcom/google/android/gms/internal/zzakw;
.super Ljava/lang/Object;


# static fields
.field private static final bgF:Lcom/google/android/gms/internal/zzala;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzala",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static final bgG:Lcom/google/android/gms/internal/zzala;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzala",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static final bgH:Lcom/google/android/gms/internal/zzakz;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzakz",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static final bgI:Lcom/google/android/gms/internal/zzakz;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzakz",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final bgE:Lcom/google/android/gms/internal/zzakz;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzakz",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/google/android/gms/internal/zzakw$1;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzakw$1;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzakw;->bgF:Lcom/google/android/gms/internal/zzala;

    new-instance v0, Lcom/google/android/gms/internal/zzakw$2;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzakw$2;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzakw;->bgG:Lcom/google/android/gms/internal/zzala;

    new-instance v0, Lcom/google/android/gms/internal/zzakz;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzakz;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/google/android/gms/internal/zzakw;->bgH:Lcom/google/android/gms/internal/zzakz;

    new-instance v0, Lcom/google/android/gms/internal/zzakz;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzakz;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/google/android/gms/internal/zzakw;->bgI:Lcom/google/android/gms/internal/zzakz;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lcom/google/android/gms/internal/zzakz;->zzcxe()Lcom/google/android/gms/internal/zzakz;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzakw;->bgE:Lcom/google/android/gms/internal/zzakz;

    return-void
.end method

.method private constructor <init>(Lcom/google/android/gms/internal/zzakz;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzakz",
            "<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzakw;->bgE:Lcom/google/android/gms/internal/zzakz;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p0, p1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    instance-of v2, p1, Lcom/google/android/gms/internal/zzakw;

    if-nez v2, :cond_2

    move v0, v1

    goto :goto_0

    :cond_2
    check-cast p1, Lcom/google/android/gms/internal/zzakw;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzakw;->bgE:Lcom/google/android/gms/internal/zzakz;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzakw;->bgE:Lcom/google/android/gms/internal/zzakz;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/zzakz;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    move v0, v1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakw;->bgE:Lcom/google/android/gms/internal/zzakz;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzakz;->hashCode()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakw;->bgE:Lcom/google/android/gms/internal/zzakz;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzakz;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0xe

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v2, "{PruneForest:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public zza(Ljava/lang/Object;Lcom/google/android/gms/internal/zzakz$zza;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lcom/google/android/gms/internal/zzakz$zza",
            "<",
            "Ljava/lang/Void;",
            "TT;>;)TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakw;->bgE:Lcom/google/android/gms/internal/zzakz;

    new-instance v1, Lcom/google/android/gms/internal/zzakw$3;

    invoke-direct {v1, p0, p2}, Lcom/google/android/gms/internal/zzakw$3;-><init>(Lcom/google/android/gms/internal/zzakw;Lcom/google/android/gms/internal/zzakz$zza;)V

    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/internal/zzakz;->zzb(Ljava/lang/Object;Lcom/google/android/gms/internal/zzakz$zza;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public zzcwz()Z
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakw;->bgE:Lcom/google/android/gms/internal/zzakz;

    sget-object v1, Lcom/google/android/gms/internal/zzakw;->bgG:Lcom/google/android/gms/internal/zzala;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzakz;->zzb(Lcom/google/android/gms/internal/zzala;)Z

    move-result v0

    return v0
.end method

.method public zzd(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzakw;
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakw;->bgE:Lcom/google/android/gms/internal/zzakz;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzakz;->zze(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzakz;

    move-result-object v1

    if-nez v1, :cond_0

    new-instance v1, Lcom/google/android/gms/internal/zzakz;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakw;->bgE:Lcom/google/android/gms/internal/zzakz;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzakz;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-direct {v1, v0}, Lcom/google/android/gms/internal/zzakz;-><init>(Ljava/lang/Object;)V

    move-object v0, v1

    :goto_0
    new-instance v1, Lcom/google/android/gms/internal/zzakw;

    invoke-direct {v1, v0}, Lcom/google/android/gms/internal/zzakw;-><init>(Lcom/google/android/gms/internal/zzakz;)V

    return-object v1

    :cond_0
    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzakz;->getValue()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakw;->bgE:Lcom/google/android/gms/internal/zzakz;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzakz;->getValue()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/google/android/gms/internal/zzajq;->zzcvg()Lcom/google/android/gms/internal/zzajq;

    move-result-object v2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakw;->bgE:Lcom/google/android/gms/internal/zzakz;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzakz;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/internal/zzakz;->zzb(Lcom/google/android/gms/internal/zzajq;Ljava/lang/Object;)Lcom/google/android/gms/internal/zzakz;

    move-result-object v0

    goto :goto_0

    :cond_1
    move-object v0, v1

    goto :goto_0
.end method

.method public zzw(Lcom/google/android/gms/internal/zzajq;)Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakw;->bgE:Lcom/google/android/gms/internal/zzakz;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzakz;->zzah(Lcom/google/android/gms/internal/zzajq;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzx(Lcom/google/android/gms/internal/zzajq;)Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakw;->bgE:Lcom/google/android/gms/internal/zzakz;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzakz;->zzah(Lcom/google/android/gms/internal/zzajq;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzy(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzakw;
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakw;->bgE:Lcom/google/android/gms/internal/zzakz;

    sget-object v1, Lcom/google/android/gms/internal/zzakw;->bgF:Lcom/google/android/gms/internal/zzala;

    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/internal/zzakz;->zzb(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzala;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Can\'t prune path that was kept previously!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzakw;->bgE:Lcom/google/android/gms/internal/zzakz;

    sget-object v1, Lcom/google/android/gms/internal/zzakw;->bgG:Lcom/google/android/gms/internal/zzala;

    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/internal/zzakz;->zzb(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzala;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    :goto_0
    return-object p0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzakw;->bgE:Lcom/google/android/gms/internal/zzakz;

    sget-object v1, Lcom/google/android/gms/internal/zzakw;->bgH:Lcom/google/android/gms/internal/zzakz;

    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/internal/zzakz;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzakz;)Lcom/google/android/gms/internal/zzakz;

    move-result-object v0

    new-instance p0, Lcom/google/android/gms/internal/zzakw;

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzakw;-><init>(Lcom/google/android/gms/internal/zzakz;)V

    goto :goto_0
.end method

.method public zzz(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzakw;
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakw;->bgE:Lcom/google/android/gms/internal/zzakz;

    sget-object v1, Lcom/google/android/gms/internal/zzakw;->bgF:Lcom/google/android/gms/internal/zzala;

    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/internal/zzakz;->zzb(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzala;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    :goto_0
    return-object p0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzakw;->bgE:Lcom/google/android/gms/internal/zzakz;

    sget-object v1, Lcom/google/android/gms/internal/zzakw;->bgI:Lcom/google/android/gms/internal/zzakz;

    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/internal/zzakz;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzakz;)Lcom/google/android/gms/internal/zzakz;

    move-result-object v0

    new-instance p0, Lcom/google/android/gms/internal/zzakw;

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzakw;-><init>(Lcom/google/android/gms/internal/zzakz;)V

    goto :goto_0
.end method
