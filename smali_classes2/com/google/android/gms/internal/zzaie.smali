.class public Lcom/google/android/gms/internal/zzaie;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzajr;


# instance fields
.field private final aZF:Lcom/google/firebase/FirebaseApp;

.field private final aZK:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final zzaht:Landroid/content/Context;


# direct methods
.method public constructor <init>(Lcom/google/firebase/FirebaseApp;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaie;->aZK:Ljava/util/Set;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaie;->aZF:Lcom/google/firebase/FirebaseApp;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaie;->aZF:Lcom/google/firebase/FirebaseApp;

    if-nez v0, :cond_0

    const-string/jumbo v0, "FirebaseDatabase"

    const-string/jumbo v1, "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const-string/jumbo v0, "FirebaseDatabase"

    const-string/jumbo v1, "ERROR: You must call FirebaseApp.initializeApp() before using Firebase Database."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const-string/jumbo v0, "FirebaseDatabase"

    const-string/jumbo v1, "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "You need to call FirebaseApp.initializeApp() before using Firebase Database."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaie;->aZF:Lcom/google/firebase/FirebaseApp;

    invoke-virtual {v0}, Lcom/google/firebase/FirebaseApp;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaie;->zzaht:Landroid/content/Context;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzaie;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaie;->zzaht:Landroid/content/Context;

    return-object v0
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzajj;Lcom/google/android/gms/internal/zzaiu;Lcom/google/android/gms/internal/zzaiw;Lcom/google/android/gms/internal/zzaiy$zza;)Lcom/google/android/gms/internal/zzaiy;
    .locals 7

    new-instance v0, Lcom/google/firebase/database/connection/idl/ConnectionConfig;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajj;->zzctu()Lcom/google/android/gms/internal/zzalx$zza;

    move-result-object v2

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajj;->zzcuo()Ljava/util/List;

    move-result-object v3

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajj;->zzcsk()Z

    move-result v4

    invoke-static {}, Lcom/google/firebase/database/FirebaseDatabase;->getSdkVersion()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajj;->zzux()Ljava/lang/String;

    move-result-object v6

    move-object v1, p3

    invoke-direct/range {v0 .. v6}, Lcom/google/firebase/database/connection/idl/ConnectionConfig;-><init>(Lcom/google/android/gms/internal/zzaiw;Lcom/google/android/gms/internal/zzalx$zza;Ljava/util/List;ZLjava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaie;->zzaht:Landroid/content/Context;

    invoke-static {v1, v0, p2, p4}, Lcom/google/firebase/database/connection/idl/zzc;->zza(Landroid/content/Context;Lcom/google/firebase/database/connection/idl/ConnectionConfig;Lcom/google/android/gms/internal/zzaiu;Lcom/google/android/gms/internal/zzaiy$zza;)Lcom/google/firebase/database/connection/idl/zzc;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaie;->aZF:Lcom/google/firebase/FirebaseApp;

    new-instance v2, Lcom/google/android/gms/internal/zzaie$2;

    invoke-direct {v2, p0, v0}, Lcom/google/android/gms/internal/zzaie$2;-><init>(Lcom/google/android/gms/internal/zzaie;Lcom/google/android/gms/internal/zzaiy;)V

    invoke-virtual {v1, v2}, Lcom/google/firebase/FirebaseApp;->zza(Lcom/google/firebase/FirebaseApp$zzb;)V

    return-object v0
.end method

.method public zza(Ljava/util/concurrent/ScheduledExecutorService;)Lcom/google/android/gms/internal/zzajf;
    .locals 2

    new-instance v0, Lcom/google/android/gms/internal/zzaic;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaie;->aZF:Lcom/google/firebase/FirebaseApp;

    invoke-direct {v0, v1, p1}, Lcom/google/android/gms/internal/zzaic;-><init>(Lcom/google/firebase/FirebaseApp;Ljava/util/concurrent/ScheduledExecutorService;)V

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzajj;)Lcom/google/android/gms/internal/zzajn;
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/zzaid;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzaid;-><init>()V

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzajj;Ljava/lang/String;)Lcom/google/android/gms/internal/zzaku;
    .locals 4

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajj;->zzcut()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v2, v3

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaie;->aZK:Ljava/util/Set;

    invoke-interface {v2, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    new-instance v1, Lcom/google/firebase/database/DatabaseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x2f

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v3, "SessionPersistenceKey \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, "\' has already been used."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/google/firebase/database/DatabaseException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaie;->aZK:Ljava/util/Set;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    new-instance v0, Lcom/google/android/gms/internal/zzaif;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaie;->zzaht:Landroid/content/Context;

    invoke-direct {v0, v2, p1, v1}, Lcom/google/android/gms/internal/zzaif;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzajj;Ljava/lang/String;)V

    new-instance v1, Lcom/google/android/gms/internal/zzaks;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajj;->zzcuq()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Lcom/google/android/gms/internal/zzaks;-><init>(J)V

    new-instance v2, Lcom/google/android/gms/internal/zzakr;

    invoke-direct {v2, p1, v0, v1}, Lcom/google/android/gms/internal/zzakr;-><init>(Lcom/google/android/gms/internal/zzajj;Lcom/google/android/gms/internal/zzakv;Lcom/google/android/gms/internal/zzakq;)V

    return-object v2
.end method

.method public zza(Lcom/google/android/gms/internal/zzajj;Lcom/google/android/gms/internal/zzalx$zza;Ljava/util/List;)Lcom/google/android/gms/internal/zzalx;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzajj;",
            "Lcom/google/android/gms/internal/zzalx$zza;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/android/gms/internal/zzalx;"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/internal/zzalu;

    invoke-direct {v0, p2, p3}, Lcom/google/android/gms/internal/zzalu;-><init>(Lcom/google/android/gms/internal/zzalx$zza;Ljava/util/List;)V

    return-object v0
.end method

.method public zzb(Lcom/google/android/gms/internal/zzajj;)Lcom/google/android/gms/internal/zzajv;
    .locals 2

    const-string/jumbo v0, "RunLoop"

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzajj;->zzss(Ljava/lang/String;)Lcom/google/android/gms/internal/zzalw;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/internal/zzaie$1;

    invoke-direct {v1, p0, v0}, Lcom/google/android/gms/internal/zzaie$1;-><init>(Lcom/google/android/gms/internal/zzaie;Lcom/google/android/gms/internal/zzalw;)V

    return-object v1
.end method

.method public zzc(Lcom/google/android/gms/internal/zzajj;)Ljava/lang/String;
    .locals 3

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v2, 0x13

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/Android"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
