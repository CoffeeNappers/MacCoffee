.class public Lcom/google/firebase/database/FirebaseDatabase;
.super Ljava/lang/Object;


# static fields
.field private static final aZf:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/firebase/database/FirebaseDatabase;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final aZg:Lcom/google/firebase/FirebaseApp;

.field private final aZh:Lcom/google/android/gms/internal/zzajt;

.field private final aZi:Lcom/google/android/gms/internal/zzajk;

.field private aZj:Lcom/google/android/gms/internal/zzajs;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/google/firebase/database/FirebaseDatabase;->aZf:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>(Lcom/google/firebase/FirebaseApp;Lcom/google/android/gms/internal/zzajt;Lcom/google/android/gms/internal/zzajk;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/database/FirebaseDatabase;->aZg:Lcom/google/firebase/FirebaseApp;

    iput-object p2, p0, Lcom/google/firebase/database/FirebaseDatabase;->aZh:Lcom/google/android/gms/internal/zzajt;

    iput-object p3, p0, Lcom/google/firebase/database/FirebaseDatabase;->aZi:Lcom/google/android/gms/internal/zzajk;

    return-void
.end method

.method public static getInstance()Lcom/google/firebase/database/FirebaseDatabase;
    .locals 1

    invoke-static {}, Lcom/google/firebase/FirebaseApp;->getInstance()Lcom/google/firebase/FirebaseApp;

    move-result-object v0

    invoke-static {v0}, Lcom/google/firebase/database/FirebaseDatabase;->getInstance(Lcom/google/firebase/FirebaseApp;)Lcom/google/firebase/database/FirebaseDatabase;

    move-result-object v0

    return-object v0
.end method

.method public static declared-synchronized getInstance(Lcom/google/firebase/FirebaseApp;)Lcom/google/firebase/database/FirebaseDatabase;
    .locals 7

    const-class v1, Lcom/google/firebase/database/FirebaseDatabase;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/google/firebase/database/FirebaseDatabase;->aZf:Ljava/util/Map;

    invoke-virtual {p0}, Lcom/google/firebase/FirebaseApp;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-virtual {p0}, Lcom/google/firebase/FirebaseApp;->getOptions()Lcom/google/firebase/FirebaseOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/FirebaseOptions;->getDatabaseUrl()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    new-instance v0, Lcom/google/firebase/database/DatabaseException;

    const-string/jumbo v2, "Failed to get FirebaseDatabase instance: FirebaseApp object has no DatabaseURL in its FirebaseOptions object."

    invoke-direct {v0, v2}, Lcom/google/firebase/database/DatabaseException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    :cond_0
    :try_start_1
    invoke-static {v0}, Lcom/google/android/gms/internal/zzann;->zztd(Ljava/lang/String;)Lcom/google/android/gms/internal/zzanl;

    move-result-object v2

    iget-object v3, v2, Lcom/google/android/gms/internal/zzanl;->aZr:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v3}, Lcom/google/android/gms/internal/zzajq;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    new-instance v3, Lcom/google/firebase/database/DatabaseException;

    iget-object v2, v2, Lcom/google/android/gms/internal/zzanl;->aZr:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzajq;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, 0x72

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v5, v6

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v5, "Configured Database URL \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v4, "\' is invalid. It should point to the root of a Firebase Database but it includes a path: "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0}, Lcom/google/firebase/database/DatabaseException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_1
    new-instance v0, Lcom/google/android/gms/internal/zzajk;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzajk;-><init>()V

    invoke-virtual {p0}, Lcom/google/firebase/FirebaseApp;->zzcnu()Z

    move-result v3

    if-nez v3, :cond_2

    invoke-virtual {p0}, Lcom/google/firebase/FirebaseApp;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/google/android/gms/internal/zzajk;->zzsv(Ljava/lang/String;)V

    :cond_2
    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/zzajk;->zzf(Lcom/google/firebase/FirebaseApp;)V

    sget-object v3, Lcom/google/firebase/database/FirebaseDatabase;->aZf:Ljava/util/Map;

    invoke-virtual {p0}, Lcom/google/firebase/FirebaseApp;->getName()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Lcom/google/firebase/database/FirebaseDatabase;

    iget-object v2, v2, Lcom/google/android/gms/internal/zzanl;->aZh:Lcom/google/android/gms/internal/zzajt;

    invoke-direct {v5, p0, v2, v0}, Lcom/google/firebase/database/FirebaseDatabase;-><init>(Lcom/google/firebase/FirebaseApp;Lcom/google/android/gms/internal/zzajt;Lcom/google/android/gms/internal/zzajk;)V

    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    sget-object v0, Lcom/google/firebase/database/FirebaseDatabase;->aZf:Ljava/util/Map;

    invoke-virtual {p0}, Lcom/google/firebase/FirebaseApp;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/database/FirebaseDatabase;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v1

    return-object v0
.end method

.method public static getSdkVersion()Ljava/lang/String;
    .locals 1

    const-string/jumbo v0, "3.0.0"

    return-object v0
.end method

.method static synthetic zza(Lcom/google/firebase/database/FirebaseDatabase;)Lcom/google/android/gms/internal/zzajs;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/database/FirebaseDatabase;->aZj:Lcom/google/android/gms/internal/zzajs;

    return-object v0
.end method

.method private declared-synchronized zzcqx()V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/firebase/database/FirebaseDatabase;->aZj:Lcom/google/android/gms/internal/zzajs;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/firebase/database/FirebaseDatabase;->aZi:Lcom/google/android/gms/internal/zzajk;

    iget-object v1, p0, Lcom/google/firebase/database/FirebaseDatabase;->aZh:Lcom/google/android/gms/internal/zzajt;

    invoke-static {v0, v1, p0}, Lcom/google/android/gms/internal/zzaju;->zza(Lcom/google/android/gms/internal/zzajj;Lcom/google/android/gms/internal/zzajt;Lcom/google/firebase/database/FirebaseDatabase;)Lcom/google/android/gms/internal/zzajs;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firebase/database/FirebaseDatabase;->aZj:Lcom/google/android/gms/internal/zzajs;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private zzsb(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Lcom/google/firebase/database/FirebaseDatabase;->aZj:Lcom/google/android/gms/internal/zzajs;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/google/firebase/database/DatabaseException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x4d

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v2, "Calls to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "() must be made before any other usage of FirebaseDatabase instance."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/firebase/database/DatabaseException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    return-void
.end method


# virtual methods
.method public getApp()Lcom/google/firebase/FirebaseApp;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/database/FirebaseDatabase;->aZg:Lcom/google/firebase/FirebaseApp;

    return-object v0
.end method

.method public getReference()Lcom/google/firebase/database/DatabaseReference;
    .locals 3

    invoke-direct {p0}, Lcom/google/firebase/database/FirebaseDatabase;->zzcqx()V

    new-instance v0, Lcom/google/firebase/database/DatabaseReference;

    iget-object v1, p0, Lcom/google/firebase/database/FirebaseDatabase;->aZj:Lcom/google/android/gms/internal/zzajs;

    invoke-static {}, Lcom/google/android/gms/internal/zzajq;->zzcvg()Lcom/google/android/gms/internal/zzajq;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/google/firebase/database/DatabaseReference;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;)V

    return-object v0
.end method

.method public getReference(Ljava/lang/String;)Lcom/google/firebase/database/DatabaseReference;
    .locals 3

    invoke-direct {p0}, Lcom/google/firebase/database/FirebaseDatabase;->zzcqx()V

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "Can\'t pass null for argument \'pathString\' in FirebaseDatabase.getReference()"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    invoke-static {p1}, Lcom/google/android/gms/internal/zzano;->zztj(Ljava/lang/String;)V

    new-instance v0, Lcom/google/android/gms/internal/zzajq;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/zzajq;-><init>(Ljava/lang/String;)V

    new-instance v1, Lcom/google/firebase/database/DatabaseReference;

    iget-object v2, p0, Lcom/google/firebase/database/FirebaseDatabase;->aZj:Lcom/google/android/gms/internal/zzajs;

    invoke-direct {v1, v2, v0}, Lcom/google/firebase/database/DatabaseReference;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;)V

    return-object v1
.end method

.method public getReferenceFromUrl(Ljava/lang/String;)Lcom/google/firebase/database/DatabaseReference;
    .locals 5

    invoke-direct {p0}, Lcom/google/firebase/database/FirebaseDatabase;->zzcqx()V

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "Can\'t pass null for argument \'url\' in FirebaseDatabase.getReferenceFromUrl()"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    invoke-static {p1}, Lcom/google/android/gms/internal/zzann;->zztd(Ljava/lang/String;)Lcom/google/android/gms/internal/zzanl;

    move-result-object v0

    iget-object v1, v0, Lcom/google/android/gms/internal/zzanl;->aZh:Lcom/google/android/gms/internal/zzajt;

    iget-object v1, v1, Lcom/google/android/gms/internal/zzajt;->baV:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/firebase/database/FirebaseDatabase;->aZj:Lcom/google/android/gms/internal/zzajs;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzajs;->zzcvp()Lcom/google/android/gms/internal/zzajt;

    move-result-object v2

    iget-object v2, v2, Lcom/google/android/gms/internal/zzajt;->baV:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    new-instance v0, Lcom/google/firebase/database/DatabaseException;

    invoke-virtual {p0}, Lcom/google/firebase/database/FirebaseDatabase;->getReference()Lcom/google/firebase/database/DatabaseReference;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/firebase/database/DatabaseReference;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x5d

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v3, v4

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v3, "Invalid URL ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ") passed to getReference().  URL was expected to match configured Database URL: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/firebase/database/DatabaseException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    new-instance v1, Lcom/google/firebase/database/DatabaseReference;

    iget-object v2, p0, Lcom/google/firebase/database/FirebaseDatabase;->aZj:Lcom/google/android/gms/internal/zzajs;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzanl;->aZr:Lcom/google/android/gms/internal/zzajq;

    invoke-direct {v1, v2, v0}, Lcom/google/firebase/database/DatabaseReference;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;)V

    return-object v1
.end method

.method public goOffline()V
    .locals 1

    invoke-direct {p0}, Lcom/google/firebase/database/FirebaseDatabase;->zzcqx()V

    iget-object v0, p0, Lcom/google/firebase/database/FirebaseDatabase;->aZj:Lcom/google/android/gms/internal/zzajs;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaju;->zzk(Lcom/google/android/gms/internal/zzajs;)V

    return-void
.end method

.method public goOnline()V
    .locals 1

    invoke-direct {p0}, Lcom/google/firebase/database/FirebaseDatabase;->zzcqx()V

    iget-object v0, p0, Lcom/google/firebase/database/FirebaseDatabase;->aZj:Lcom/google/android/gms/internal/zzajs;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaju;->zzl(Lcom/google/android/gms/internal/zzajs;)V

    return-void
.end method

.method public purgeOutstandingWrites()V
    .locals 2

    invoke-direct {p0}, Lcom/google/firebase/database/FirebaseDatabase;->zzcqx()V

    iget-object v0, p0, Lcom/google/firebase/database/FirebaseDatabase;->aZj:Lcom/google/android/gms/internal/zzajs;

    new-instance v1, Lcom/google/firebase/database/FirebaseDatabase$1;

    invoke-direct {v1, p0}, Lcom/google/firebase/database/FirebaseDatabase$1;-><init>(Lcom/google/firebase/database/FirebaseDatabase;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzajs;->zzs(Ljava/lang/Runnable;)V

    return-void
.end method

.method public declared-synchronized setLogLevel(Lcom/google/firebase/database/Logger$Level;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    const-string/jumbo v0, "setLogLevel"

    invoke-direct {p0, v0}, Lcom/google/firebase/database/FirebaseDatabase;->zzsb(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/firebase/database/FirebaseDatabase;->aZi:Lcom/google/android/gms/internal/zzajk;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzajk;->setLogLevel(Lcom/google/firebase/database/Logger$Level;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setPersistenceEnabled(Z)V
    .locals 1

    monitor-enter p0

    :try_start_0
    const-string/jumbo v0, "setPersistenceEnabled"

    invoke-direct {p0, v0}, Lcom/google/firebase/database/FirebaseDatabase;->zzsb(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/firebase/database/FirebaseDatabase;->aZi:Lcom/google/android/gms/internal/zzajk;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzajk;->setPersistenceEnabled(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
