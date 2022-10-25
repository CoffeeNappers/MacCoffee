.class public Lcom/google/firebase/database/MutableData;
.super Ljava/lang/Object;


# instance fields
.field private final aZm:Lcom/google/android/gms/internal/zzajx;

.field private final aZn:Lcom/google/android/gms/internal/zzajq;


# direct methods
.method private constructor <init>(Lcom/google/android/gms/internal/zzajx;Lcom/google/android/gms/internal/zzajq;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/database/MutableData;->aZm:Lcom/google/android/gms/internal/zzajx;

    iput-object p2, p0, Lcom/google/firebase/database/MutableData;->aZn:Lcom/google/android/gms/internal/zzajq;

    iget-object v0, p0, Lcom/google/firebase/database/MutableData;->aZn:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {p0}, Lcom/google/firebase/database/MutableData;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzakf;->zza(Lcom/google/android/gms/internal/zzajq;Ljava/lang/Object;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/internal/zzajx;Lcom/google/android/gms/internal/zzajq;Lcom/google/firebase/database/MutableData$1;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/google/firebase/database/MutableData;-><init>(Lcom/google/android/gms/internal/zzajx;Lcom/google/android/gms/internal/zzajq;)V

    return-void
.end method

.method constructor <init>(Lcom/google/android/gms/internal/zzaml;)V
    .locals 3

    new-instance v0, Lcom/google/android/gms/internal/zzajx;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/zzajx;-><init>(Lcom/google/android/gms/internal/zzaml;)V

    new-instance v1, Lcom/google/android/gms/internal/zzajq;

    const-string/jumbo v2, ""

    invoke-direct {v1, v2}, Lcom/google/android/gms/internal/zzajq;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0, v1}, Lcom/google/firebase/database/MutableData;-><init>(Lcom/google/android/gms/internal/zzajx;Lcom/google/android/gms/internal/zzajq;)V

    return-void
.end method

.method static synthetic zza(Lcom/google/firebase/database/MutableData;)Lcom/google/android/gms/internal/zzajx;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/database/MutableData;->aZm:Lcom/google/android/gms/internal/zzajx;

    return-object v0
.end method

.method static synthetic zzb(Lcom/google/firebase/database/MutableData;)Lcom/google/android/gms/internal/zzajq;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/database/MutableData;->aZn:Lcom/google/android/gms/internal/zzajq;

    return-object v0
.end method


# virtual methods
.method public child(Ljava/lang/String;)Lcom/google/firebase/database/MutableData;
    .locals 4

    invoke-static {p1}, Lcom/google/android/gms/internal/zzano;->zzti(Ljava/lang/String;)V

    new-instance v0, Lcom/google/firebase/database/MutableData;

    iget-object v1, p0, Lcom/google/firebase/database/MutableData;->aZm:Lcom/google/android/gms/internal/zzajx;

    iget-object v2, p0, Lcom/google/firebase/database/MutableData;->aZn:Lcom/google/android/gms/internal/zzajq;

    new-instance v3, Lcom/google/android/gms/internal/zzajq;

    invoke-direct {v3, p1}, Lcom/google/android/gms/internal/zzajq;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/zzajq;->zzh(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzajq;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/google/firebase/database/MutableData;-><init>(Lcom/google/android/gms/internal/zzajx;Lcom/google/android/gms/internal/zzajq;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2

    instance-of v0, p1, Lcom/google/firebase/database/MutableData;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/google/firebase/database/MutableData;->aZm:Lcom/google/android/gms/internal/zzajx;

    move-object v0, p1

    check-cast v0, Lcom/google/firebase/database/MutableData;

    iget-object v0, v0, Lcom/google/firebase/database/MutableData;->aZm:Lcom/google/android/gms/internal/zzajx;

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/firebase/database/MutableData;->aZn:Lcom/google/android/gms/internal/zzajq;

    check-cast p1, Lcom/google/firebase/database/MutableData;

    iget-object v1, p1, Lcom/google/firebase/database/MutableData;->aZn:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzajq;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getChildren()Ljava/lang/Iterable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable",
            "<",
            "Lcom/google/firebase/database/MutableData;",
            ">;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/firebase/database/MutableData;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->zzcze()Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    new-instance v0, Lcom/google/firebase/database/MutableData$1;

    invoke-direct {v0, p0}, Lcom/google/firebase/database/MutableData$1;-><init>(Lcom/google/firebase/database/MutableData;)V

    :goto_0
    return-object v0

    :cond_1
    invoke-static {v0}, Lcom/google/android/gms/internal/zzamg;->zzn(Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzamg;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamg;->iterator()Ljava/util/Iterator;

    move-result-object v1

    new-instance v0, Lcom/google/firebase/database/MutableData$2;

    invoke-direct {v0, p0, v1}, Lcom/google/firebase/database/MutableData$2;-><init>(Lcom/google/firebase/database/MutableData;Ljava/util/Iterator;)V

    goto :goto_0
.end method

.method public getChildrenCount()J
    .locals 2

    invoke-virtual {p0}, Lcom/google/firebase/database/MutableData;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->getChildCount()I

    move-result v0

    int-to-long v0, v0

    return-wide v0
.end method

.method public getKey()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/database/MutableData;->aZn:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajq;->zzcvm()Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/firebase/database/MutableData;->aZn:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajq;->zzcvm()Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalz;->asString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getPriority()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcom/google/firebase/database/MutableData;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->zzczf()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->getValue()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getValue()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcom/google/firebase/database/MutableData;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->getValue()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getValue(Lcom/google/firebase/database/GenericTypeIndicator;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/firebase/database/GenericTypeIndicator",
            "<TT;>;)TT;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/firebase/database/MutableData;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/google/android/gms/internal/zzanp;->zza(Ljava/lang/Object;Lcom/google/firebase/database/GenericTypeIndicator;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getValue(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/firebase/database/MutableData;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/google/android/gms/internal/zzanp;->zza(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public hasChild(Ljava/lang/String;)Z
    .locals 2

    invoke-virtual {p0}, Lcom/google/firebase/database/MutableData;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/internal/zzajq;

    invoke-direct {v1, p1}, Lcom/google/android/gms/internal/zzajq;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzaml;->zzao(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasChildren()Z
    .locals 2

    invoke-virtual {p0}, Lcom/google/firebase/database/MutableData;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->zzcze()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setPriority(Ljava/lang/Object;)V
    .locals 4

    iget-object v0, p0, Lcom/google/firebase/database/MutableData;->aZm:Lcom/google/android/gms/internal/zzajx;

    iget-object v1, p0, Lcom/google/firebase/database/MutableData;->aZn:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {p0}, Lcom/google/firebase/database/MutableData;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v2

    invoke-static {p1}, Lcom/google/android/gms/internal/zzamp;->zzbu(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/google/android/gms/internal/zzaml;->zzg(Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzajx;->zzg(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)V

    return-void
.end method

.method public setValue(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/firebase/database/DatabaseException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/database/MutableData;->aZn:Lcom/google/android/gms/internal/zzajq;

    invoke-static {v0, p1}, Lcom/google/android/gms/internal/zzakf;->zza(Lcom/google/android/gms/internal/zzajq;Ljava/lang/Object;)V

    invoke-static {p1}, Lcom/google/android/gms/internal/zzanp;->zzby(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzano;->zzbx(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/google/firebase/database/MutableData;->aZm:Lcom/google/android/gms/internal/zzajx;

    iget-object v2, p0, Lcom/google/firebase/database/MutableData;->aZn:Lcom/google/android/gms/internal/zzajq;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzamm;->zzbt(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/internal/zzajx;->zzg(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    iget-object v0, p0, Lcom/google/firebase/database/MutableData;->aZn:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajq;->zzcvj()Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalz;->asString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    iget-object v1, p0, Lcom/google/firebase/database/MutableData;->aZm:Lcom/google/android/gms/internal/zzajx;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzajx;->zzcvw()Lcom/google/android/gms/internal/zzaml;

    move-result-object v1

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Lcom/google/android/gms/internal/zzaml;->getValue(Z)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x20

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v3, v4

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v3, "MutableData { key = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, ", value = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " }"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const-string/jumbo v0, "<none>"

    goto :goto_0
.end method

.method zzcqy()Lcom/google/android/gms/internal/zzaml;
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/database/MutableData;->aZm:Lcom/google/android/gms/internal/zzajx;

    iget-object v1, p0, Lcom/google/firebase/database/MutableData;->aZn:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzajx;->zzq(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    return-object v0
.end method
