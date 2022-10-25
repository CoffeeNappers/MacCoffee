.class public Lcom/google/firebase/database/DatabaseReference;
.super Lcom/google/firebase/database/Query;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/database/DatabaseReference$CompletionListener;
    }
.end annotation


# static fields
.field private static aYW:Lcom/google/android/gms/internal/zzajk;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/google/firebase/database/Query;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;)V

    return-void
.end method

.method public static goOffline()V
    .locals 1

    invoke-static {}, Lcom/google/firebase/database/DatabaseReference;->zzcqw()Lcom/google/android/gms/internal/zzajk;

    move-result-object v0

    invoke-static {v0}, Lcom/google/firebase/database/DatabaseReference;->zza(Lcom/google/android/gms/internal/zzajk;)V

    return-void
.end method

.method public static goOnline()V
    .locals 1

    invoke-static {}, Lcom/google/firebase/database/DatabaseReference;->zzcqw()Lcom/google/android/gms/internal/zzajk;

    move-result-object v0

    invoke-static {v0}, Lcom/google/firebase/database/DatabaseReference;->zzb(Lcom/google/android/gms/internal/zzajk;)V

    return-void
.end method

.method private zza(Lcom/google/android/gms/internal/zzaml;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)Lcom/google/android/gms/tasks/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzaml;",
            "Lcom/google/firebase/database/DatabaseReference$CompletionListener;",
            ")",
            "Lcom/google/android/gms/tasks/Task",
            "<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/firebase/database/DatabaseReference;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzano;->zzaq(Lcom/google/android/gms/internal/zzajq;)V

    invoke-static {p2}, Lcom/google/android/gms/internal/zzann;->zzb(Lcom/google/firebase/database/DatabaseReference$CompletionListener;)Lcom/google/android/gms/internal/zzank;

    move-result-object v0

    iget-object v1, p0, Lcom/google/firebase/database/DatabaseReference;->aZj:Lcom/google/android/gms/internal/zzajs;

    new-instance v2, Lcom/google/firebase/database/DatabaseReference$2;

    invoke-direct {v2, p0, p1, v0}, Lcom/google/firebase/database/DatabaseReference$2;-><init>(Lcom/google/firebase/database/DatabaseReference;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzank;)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzajs;->zzs(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzank;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/tasks/Task;

    return-object v0
.end method

.method private zza(Ljava/lang/Object;Lcom/google/android/gms/internal/zzaml;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)Lcom/google/android/gms/tasks/Task;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lcom/google/android/gms/internal/zzaml;",
            "Lcom/google/firebase/database/DatabaseReference$CompletionListener;",
            ")",
            "Lcom/google/android/gms/tasks/Task",
            "<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/firebase/database/DatabaseReference;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzano;->zzaq(Lcom/google/android/gms/internal/zzajq;)V

    invoke-virtual {p0}, Lcom/google/firebase/database/DatabaseReference;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/google/android/gms/internal/zzakf;->zza(Lcom/google/android/gms/internal/zzajq;Ljava/lang/Object;)V

    invoke-static {p1}, Lcom/google/android/gms/internal/zzanp;->zzby(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzano;->zzbx(Ljava/lang/Object;)V

    invoke-static {v0, p2}, Lcom/google/android/gms/internal/zzamm;->zza(Ljava/lang/Object;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-static {p3}, Lcom/google/android/gms/internal/zzann;->zzb(Lcom/google/firebase/database/DatabaseReference$CompletionListener;)Lcom/google/android/gms/internal/zzank;

    move-result-object v1

    iget-object v2, p0, Lcom/google/firebase/database/DatabaseReference;->aZj:Lcom/google/android/gms/internal/zzajs;

    new-instance v3, Lcom/google/firebase/database/DatabaseReference$1;

    invoke-direct {v3, p0, v0, v1}, Lcom/google/firebase/database/DatabaseReference$1;-><init>(Lcom/google/firebase/database/DatabaseReference;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzank;)V

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/zzajs;->zzs(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzank;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/tasks/Task;

    return-object v0
.end method

.method private zza(Ljava/util/Map;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)Lcom/google/android/gms/tasks/Task;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/google/firebase/database/DatabaseReference$CompletionListener;",
            ")",
            "Lcom/google/android/gms/tasks/Task",
            "<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "Can\'t pass null for argument \'update\' in updateChildren()"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    invoke-static {p1}, Lcom/google/android/gms/internal/zzanp;->zzcf(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/firebase/database/DatabaseReference;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/zzano;->zzc(Lcom/google/android/gms/internal/zzajq;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/internal/zzajh;->zzcb(Ljava/util/Map;)Lcom/google/android/gms/internal/zzajh;

    move-result-object v1

    invoke-static {p2}, Lcom/google/android/gms/internal/zzann;->zzb(Lcom/google/firebase/database/DatabaseReference$CompletionListener;)Lcom/google/android/gms/internal/zzank;

    move-result-object v2

    iget-object v3, p0, Lcom/google/firebase/database/DatabaseReference;->aZj:Lcom/google/android/gms/internal/zzajs;

    new-instance v4, Lcom/google/firebase/database/DatabaseReference$3;

    invoke-direct {v4, p0, v1, v2, v0}, Lcom/google/firebase/database/DatabaseReference$3;-><init>(Lcom/google/firebase/database/DatabaseReference;Lcom/google/android/gms/internal/zzajh;Lcom/google/android/gms/internal/zzank;Ljava/util/Map;)V

    invoke-virtual {v3, v4}, Lcom/google/android/gms/internal/zzajs;->zzs(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzank;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/tasks/Task;

    return-object v0
.end method

.method static zza(Lcom/google/android/gms/internal/zzajk;)V
    .locals 0

    invoke-static {p0}, Lcom/google/android/gms/internal/zzaju;->zzd(Lcom/google/android/gms/internal/zzajj;)V

    return-void
.end method

.method static zzb(Lcom/google/android/gms/internal/zzajk;)V
    .locals 0

    invoke-static {p0}, Lcom/google/android/gms/internal/zzaju;->zze(Lcom/google/android/gms/internal/zzajj;)V

    return-void
.end method

.method private static declared-synchronized zzcqw()Lcom/google/android/gms/internal/zzajk;
    .locals 2

    const-class v1, Lcom/google/firebase/database/DatabaseReference;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/google/firebase/database/DatabaseReference;->aYW:Lcom/google/android/gms/internal/zzajk;

    if-nez v0, :cond_0

    new-instance v0, Lcom/google/android/gms/internal/zzajk;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzajk;-><init>()V

    sput-object v0, Lcom/google/firebase/database/DatabaseReference;->aYW:Lcom/google/android/gms/internal/zzajk;

    :cond_0
    sget-object v0, Lcom/google/firebase/database/DatabaseReference;->aYW:Lcom/google/android/gms/internal/zzajk;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public child(Ljava/lang/String;)Lcom/google/firebase/database/DatabaseReference;
    .locals 3

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "Can\'t pass null for argument \'pathString\' in child()"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    invoke-virtual {p0}, Lcom/google/firebase/database/DatabaseReference;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajq;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p1}, Lcom/google/android/gms/internal/zzano;->zztj(Ljava/lang/String;)V

    :goto_0
    invoke-virtual {p0}, Lcom/google/firebase/database/DatabaseReference;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/internal/zzajq;

    invoke-direct {v1, p1}, Lcom/google/android/gms/internal/zzajq;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzajq;->zzh(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    new-instance v1, Lcom/google/firebase/database/DatabaseReference;

    iget-object v2, p0, Lcom/google/firebase/database/DatabaseReference;->aZj:Lcom/google/android/gms/internal/zzajs;

    invoke-direct {v1, v2, v0}, Lcom/google/firebase/database/DatabaseReference;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;)V

    return-object v1

    :cond_1
    invoke-static {p1}, Lcom/google/android/gms/internal/zzano;->zzti(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2

    instance-of v0, p1, Lcom/google/firebase/database/DatabaseReference;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/google/firebase/database/DatabaseReference;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getDatabase()Lcom/google/firebase/database/FirebaseDatabase;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/database/DatabaseReference;->aZj:Lcom/google/android/gms/internal/zzajs;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajs;->getDatabase()Lcom/google/firebase/database/FirebaseDatabase;

    move-result-object v0

    return-object v0
.end method

.method public getKey()Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Lcom/google/firebase/database/DatabaseReference;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajq;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/google/firebase/database/DatabaseReference;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajq;->zzcvm()Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalz;->asString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getParent()Lcom/google/firebase/database/DatabaseReference;
    .locals 3

    invoke-virtual {p0}, Lcom/google/firebase/database/DatabaseReference;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajq;->zzcvl()Lcom/google/android/gms/internal/zzajq;

    move-result-object v1

    if-eqz v1, :cond_0

    new-instance v0, Lcom/google/firebase/database/DatabaseReference;

    iget-object v2, p0, Lcom/google/firebase/database/DatabaseReference;->aZj:Lcom/google/android/gms/internal/zzajs;

    invoke-direct {v0, v2, v1}, Lcom/google/firebase/database/DatabaseReference;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;)V

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getRoot()Lcom/google/firebase/database/DatabaseReference;
    .locals 4

    new-instance v0, Lcom/google/firebase/database/DatabaseReference;

    iget-object v1, p0, Lcom/google/firebase/database/DatabaseReference;->aZj:Lcom/google/android/gms/internal/zzajs;

    new-instance v2, Lcom/google/android/gms/internal/zzajq;

    const-string/jumbo v3, ""

    invoke-direct {v2, v3}, Lcom/google/android/gms/internal/zzajq;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1, v2}, Lcom/google/firebase/database/DatabaseReference;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;)V

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    invoke-virtual {p0}, Lcom/google/firebase/database/DatabaseReference;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public onDisconnect()Lcom/google/firebase/database/OnDisconnect;
    .locals 3

    invoke-virtual {p0}, Lcom/google/firebase/database/DatabaseReference;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzano;->zzaq(Lcom/google/android/gms/internal/zzajq;)V

    new-instance v0, Lcom/google/firebase/database/OnDisconnect;

    iget-object v1, p0, Lcom/google/firebase/database/DatabaseReference;->aZj:Lcom/google/android/gms/internal/zzajs;

    invoke-virtual {p0}, Lcom/google/firebase/database/DatabaseReference;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/google/firebase/database/OnDisconnect;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;)V

    return-object v0
.end method

.method public push()Lcom/google/firebase/database/DatabaseReference;
    .locals 4

    iget-object v0, p0, Lcom/google/firebase/database/DatabaseReference;->aZj:Lcom/google/android/gms/internal/zzajs;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajs;->zzcvq()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzanm;->zzco(J)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzalz;->zzsx(Ljava/lang/String;)Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    new-instance v1, Lcom/google/firebase/database/DatabaseReference;

    iget-object v2, p0, Lcom/google/firebase/database/DatabaseReference;->aZj:Lcom/google/android/gms/internal/zzajs;

    invoke-virtual {p0}, Lcom/google/firebase/database/DatabaseReference;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/google/android/gms/internal/zzajq;->zza(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    invoke-direct {v1, v2, v0}, Lcom/google/firebase/database/DatabaseReference;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;)V

    return-object v1
.end method

.method public removeValue()Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task",
            "<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/firebase/database/DatabaseReference;->setValue(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method public removeValue(Lcom/google/firebase/database/DatabaseReference$CompletionListener;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lcom/google/firebase/database/DatabaseReference;->setValue(Ljava/lang/Object;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)V

    return-void
.end method

.method public runTransaction(Lcom/google/firebase/database/Transaction$Handler;)V
    .locals 1

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/google/firebase/database/DatabaseReference;->runTransaction(Lcom/google/firebase/database/Transaction$Handler;Z)V

    return-void
.end method

.method public runTransaction(Lcom/google/firebase/database/Transaction$Handler;Z)V
    .locals 2

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "Can\'t pass null for argument \'handler\' in runTransaction()"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    invoke-virtual {p0}, Lcom/google/firebase/database/DatabaseReference;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzano;->zzaq(Lcom/google/android/gms/internal/zzajq;)V

    iget-object v0, p0, Lcom/google/firebase/database/DatabaseReference;->aZj:Lcom/google/android/gms/internal/zzajs;

    new-instance v1, Lcom/google/firebase/database/DatabaseReference$4;

    invoke-direct {v1, p0, p1, p2}, Lcom/google/firebase/database/DatabaseReference$4;-><init>(Lcom/google/firebase/database/DatabaseReference;Lcom/google/firebase/database/Transaction$Handler;Z)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzajs;->zzs(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setPriority(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Lcom/google/android/gms/tasks/Task",
            "<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    invoke-static {p1}, Lcom/google/android/gms/internal/zzamp;->zzbu(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/google/firebase/database/DatabaseReference;->zza(Lcom/google/android/gms/internal/zzaml;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method public setPriority(Ljava/lang/Object;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)V
    .locals 1

    invoke-static {p1}, Lcom/google/android/gms/internal/zzamp;->zzbu(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lcom/google/firebase/database/DatabaseReference;->zza(Lcom/google/android/gms/internal/zzaml;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public setValue(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Lcom/google/android/gms/tasks/Task",
            "<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    const/4 v1, 0x0

    invoke-static {v1}, Lcom/google/android/gms/internal/zzamp;->zzbu(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-direct {p0, p1, v0, v1}, Lcom/google/firebase/database/DatabaseReference;->zza(Ljava/lang/Object;Lcom/google/android/gms/internal/zzaml;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method public setValue(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")",
            "Lcom/google/android/gms/tasks/Task",
            "<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    invoke-static {p2}, Lcom/google/android/gms/internal/zzamp;->zzbu(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/google/firebase/database/DatabaseReference;->zza(Ljava/lang/Object;Lcom/google/android/gms/internal/zzaml;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method public setValue(Ljava/lang/Object;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)V
    .locals 1

    const/4 v0, 0x0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzamp;->zzbu(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-direct {p0, p1, v0, p2}, Lcom/google/firebase/database/DatabaseReference;->zza(Ljava/lang/Object;Lcom/google/android/gms/internal/zzaml;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public setValue(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)V
    .locals 1

    invoke-static {p2}, Lcom/google/android/gms/internal/zzamp;->zzbu(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-direct {p0, p1, v0, p3}, Lcom/google/firebase/database/DatabaseReference;->zza(Ljava/lang/Object;Lcom/google/android/gms/internal/zzaml;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    invoke-virtual {p0}, Lcom/google/firebase/database/DatabaseReference;->getParent()Lcom/google/firebase/database/DatabaseReference;

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/firebase/database/DatabaseReference;->aZj:Lcom/google/android/gms/internal/zzajs;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajs;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    :try_start_0
    invoke-virtual {v0}, Lcom/google/firebase/database/DatabaseReference;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/firebase/database/DatabaseReference;->getKey()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "UTF-8"

    invoke-static {v1, v2}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "+"

    const-string/jumbo v3, "%20"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v3, v4

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, "/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_0

    :catch_0
    move-exception v0

    move-object v1, v0

    new-instance v2, Lcom/google/firebase/database/DatabaseException;

    const-string/jumbo v3, "Failed to URLEncode key: "

    invoke-virtual {p0}, Lcom/google/firebase/database/DatabaseReference;->getKey()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_1
    invoke-direct {v2, v0, v1}, Lcom/google/firebase/database/DatabaseException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    :cond_1
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v3}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public updateChildren(Ljava/util/Map;)Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/google/android/gms/tasks/Task",
            "<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/firebase/database/DatabaseReference;->zza(Ljava/util/Map;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method public updateChildren(Ljava/util/Map;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/google/firebase/database/DatabaseReference$CompletionListener;",
            ")V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Lcom/google/firebase/database/DatabaseReference;->zza(Ljava/util/Map;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method
