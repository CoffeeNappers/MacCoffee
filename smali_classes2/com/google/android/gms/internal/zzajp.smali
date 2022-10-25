.class final enum Lcom/google/android/gms/internal/zzajp;
.super Ljava/lang/Enum;

# interfaces
.implements Lcom/google/android/gms/internal/zzajr;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/google/android/gms/internal/zzajp;",
        ">;",
        "Lcom/google/android/gms/internal/zzajr;"
    }
.end annotation


# static fields
.field public static final enum bdC:Lcom/google/android/gms/internal/zzajp;

.field private static final synthetic bdD:[Lcom/google/android/gms/internal/zzajp;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v2, 0x0

    new-instance v0, Lcom/google/android/gms/internal/zzajp;

    const-string/jumbo v1, "INSTANCE"

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzajp;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/gms/internal/zzajp;->bdC:Lcom/google/android/gms/internal/zzajp;

    const/4 v0, 0x1

    new-array v0, v0, [Lcom/google/android/gms/internal/zzajp;

    sget-object v1, Lcom/google/android/gms/internal/zzajp;->bdC:Lcom/google/android/gms/internal/zzajp;

    aput-object v1, v0, v2

    sput-object v0, Lcom/google/android/gms/internal/zzajp;->bdD:[Lcom/google/android/gms/internal/zzajp;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static values()[Lcom/google/android/gms/internal/zzajp;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzajp;->bdD:[Lcom/google/android/gms/internal/zzajp;

    invoke-virtual {v0}, [Lcom/google/android/gms/internal/zzajp;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/android/gms/internal/zzajp;

    return-object v0
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzajj;Lcom/google/android/gms/internal/zzaiu;Lcom/google/android/gms/internal/zzaiw;Lcom/google/android/gms/internal/zzaiy$zza;)Lcom/google/android/gms/internal/zzaiy;
    .locals 2

    new-instance v0, Lcom/google/android/gms/internal/zzaiz;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajj;->zzcup()Lcom/google/android/gms/internal/zzaiu;

    move-result-object v1

    invoke-direct {v0, v1, p3, p4}, Lcom/google/android/gms/internal/zzaiz;-><init>(Lcom/google/android/gms/internal/zzaiu;Lcom/google/android/gms/internal/zzaiw;Lcom/google/android/gms/internal/zzaiy$zza;)V

    return-object v0
.end method

.method public zza(Ljava/util/concurrent/ScheduledExecutorService;)Lcom/google/android/gms/internal/zzajf;
    .locals 2

    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Authentication is not implemented yet"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzajj;)Lcom/google/android/gms/internal/zzajn;
    .locals 3

    new-instance v0, Lcom/google/android/gms/internal/zzakd;

    invoke-static {}, Ljava/util/concurrent/Executors;->defaultThreadFactory()Ljava/util/concurrent/ThreadFactory;

    move-result-object v1

    sget-object v2, Lcom/google/android/gms/internal/zzakc;->bfH:Lcom/google/android/gms/internal/zzakc;

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzakd;-><init>(Ljava/util/concurrent/ThreadFactory;Lcom/google/android/gms/internal/zzakc;)V

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzajj;Ljava/lang/String;)Lcom/google/android/gms/internal/zzaku;
    .locals 1

    const/4 v0, 0x0

    return-object v0
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

    new-instance v0, Lcom/google/android/gms/internal/zzalv;

    invoke-direct {v0, p2, p3}, Lcom/google/android/gms/internal/zzalv;-><init>(Lcom/google/android/gms/internal/zzalx$zza;Ljava/util/List;)V

    return-object v0
.end method

.method public zzb(Lcom/google/android/gms/internal/zzajj;)Lcom/google/android/gms/internal/zzajv;
    .locals 2

    const-string/jumbo v0, "RunLoop"

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzajj;->zzss(Ljava/lang/String;)Lcom/google/android/gms/internal/zzalw;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/internal/zzajp$1;

    invoke-direct {v1, p0, v0}, Lcom/google/android/gms/internal/zzajp$1;-><init>(Lcom/google/android/gms/internal/zzajp;Lcom/google/android/gms/internal/zzalw;)V

    return-object v1
.end method

.method public zzc(Lcom/google/android/gms/internal/zzajj;)Ljava/lang/String;
    .locals 5

    const-string/jumbo v0, "java.vm.name"

    const-string/jumbo v1, "Unknown JVM"

    invoke-static {v0, v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "java.specification.version"

    const-string/jumbo v2, "Unknown"

    invoke-static {v1, v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v3, v4

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
