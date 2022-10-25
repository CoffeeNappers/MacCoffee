.class Lcom/google/android/gms/internal/zzamb$zza;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzamb;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "zza"
.end annotation


# instance fields
.field private biF:Ljava/lang/StringBuilder;

.field private biG:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack",
            "<",
            "Lcom/google/android/gms/internal/zzalz;",
            ">;"
        }
    .end annotation
.end field

.field private biH:I

.field private biI:I

.field private biJ:Z

.field private final biK:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzajq;",
            ">;"
        }
    .end annotation
.end field

.field private final biL:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final biM:Lcom/google/android/gms/internal/zzamb$zzc;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzamb$zzc;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biF:Ljava/lang/StringBuilder;

    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biG:Ljava/util/Stack;

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biH:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biJ:Z

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biK:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biL:Ljava/util/List;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzamb$zza;->biM:Lcom/google/android/gms/internal/zzamb$zzc;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzamb$zza;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzamb$zza;->zzczo()V

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzamb$zza;Lcom/google/android/gms/internal/zzalz;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzamb$zza;->zzn(Lcom/google/android/gms/internal/zzalz;)V

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzamb$zza;Lcom/google/android/gms/internal/zzami;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzamb$zza;->zzb(Lcom/google/android/gms/internal/zzami;)V

    return-void
.end method

.method private zza(Ljava/lang/StringBuilder;Lcom/google/android/gms/internal/zzalz;)V
    .locals 1

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzalz;->asString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzann;->zztf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.method private zzaga(I)Lcom/google/android/gms/internal/zzajq;
    .locals 3

    new-array v2, p1, [Lcom/google/android/gms/internal/zzalz;

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    if-ge v1, p1, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biG:Ljava/util/Stack;

    invoke-virtual {v0, v1}, Ljava/util/Stack;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzalz;

    aput-object v0, v2, v1

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/zzajq;

    invoke-direct {v0, v2}, Lcom/google/android/gms/internal/zzajq;-><init>([Lcom/google/android/gms/internal/zzalz;)V

    return-object v0
.end method

.method static synthetic zzb(Lcom/google/android/gms/internal/zzamb$zza;)Ljava/util/List;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biK:Ljava/util/List;

    return-object v0
.end method

.method private zzb(Lcom/google/android/gms/internal/zzami;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzami",
            "<*>;)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzamb$zza;->zzczm()V

    iget v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biI:I

    iput v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biH:I

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biF:Ljava/lang/StringBuilder;

    sget-object v1, Lcom/google/android/gms/internal/zzaml$zza;->bjf:Lcom/google/android/gms/internal/zzaml$zza;

    invoke-virtual {p1, v1}, Lcom/google/android/gms/internal/zzami;->zza(Lcom/google/android/gms/internal/zzaml$zza;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biJ:Z

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biM:Lcom/google/android/gms/internal/zzamb$zzc;

    invoke-interface {v0, p0}, Lcom/google/android/gms/internal/zzamb$zzc;->zze(Lcom/google/android/gms/internal/zzamb$zza;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzamb$zza;->zzczp()V

    :cond_0
    return-void
.end method

.method static synthetic zzc(Lcom/google/android/gms/internal/zzamb$zza;)Ljava/util/List;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biL:Ljava/util/List;

    return-object v0
.end method

.method private zzczm()V
    .locals 3

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzamb$zza;->zzczj()Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biF:Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biF:Ljava/lang/StringBuilder;

    const-string/jumbo v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biI:I

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzamb$zza;->zzaga(I)Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajq;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzalz;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzamb$zza;->biF:Ljava/lang/StringBuilder;

    invoke-direct {p0, v2, v0}, Lcom/google/android/gms/internal/zzamb$zza;->zza(Ljava/lang/StringBuilder;Lcom/google/android/gms/internal/zzalz;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biF:Ljava/lang/StringBuilder;

    const-string/jumbo v2, ":("

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biJ:Z

    :cond_1
    return-void
.end method

.method private zzczn()V
    .locals 2

    iget v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biI:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biI:I

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzamb$zza;->zzczj()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biF:Ljava/lang/StringBuilder;

    const-string/jumbo v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biJ:Z

    return-void
.end method

.method private zzczo()V
    .locals 2

    iget v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biI:I

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    const-string/jumbo v1, "Can\'t finish hashing in the middle processing a child"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzann;->zzb(ZLjava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzamb$zza;->zzczj()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzamb$zza;->zzczp()V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biL:Ljava/util/List;

    const-string/jumbo v1, ""

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private zzczp()V
    .locals 3

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzamb$zza;->zzczj()Z

    move-result v0

    const-string/jumbo v1, "Can\'t end range without starting a range!"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzann;->zzb(ZLjava/lang/String;)V

    const/4 v0, 0x0

    :goto_0
    iget v1, p0, Lcom/google/android/gms/internal/zzamb$zza;->biI:I

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzamb$zza;->biF:Ljava/lang/StringBuilder;

    const-string/jumbo v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biF:Ljava/lang/StringBuilder;

    const-string/jumbo v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biH:I

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzamb$zza;->zzaga(I)Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzamb$zza;->biF:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/internal/zzann;->zzte(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzamb$zza;->biL:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/google/android/gms/internal/zzamb$zza;->biK:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biF:Ljava/lang/StringBuilder;

    return-void
.end method

.method static synthetic zzd(Lcom/google/android/gms/internal/zzamb$zza;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzamb$zza;->zzczn()V

    return-void
.end method

.method private zzn(Lcom/google/android/gms/internal/zzalz;)V
    .locals 2

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzamb$zza;->zzczm()V

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biJ:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biF:Ljava/lang/StringBuilder;

    const-string/jumbo v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biF:Ljava/lang/StringBuilder;

    invoke-direct {p0, v0, p1}, Lcom/google/android/gms/internal/zzamb$zza;->zza(Ljava/lang/StringBuilder;Lcom/google/android/gms/internal/zzalz;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biF:Ljava/lang/StringBuilder;

    const-string/jumbo v1, ":("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biI:I

    iget-object v1, p0, Lcom/google/android/gms/internal/zzamb$zza;->biG:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->size()I

    move-result v1

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biG:Ljava/util/Stack;

    invoke-virtual {v0, p1}, Ljava/util/Stack;->add(Ljava/lang/Object;)Z

    :goto_0
    iget v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biI:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biI:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biJ:Z

    return-void

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biG:Ljava/util/Stack;

    iget v1, p0, Lcom/google/android/gms/internal/zzamb$zza;->biI:I

    invoke-virtual {v0, v1, p1}, Ljava/util/Stack;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method


# virtual methods
.method public zzczj()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biF:Ljava/lang/StringBuilder;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzczk()I
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biF:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    return v0
.end method

.method public zzczl()Lcom/google/android/gms/internal/zzajq;
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/zzamb$zza;->biI:I

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzamb$zza;->zzaga(I)Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    return-object v0
.end method
