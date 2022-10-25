.class public Lcom/google/android/gms/internal/zzaiu;
.super Ljava/lang/Object;


# instance fields
.field private final aZE:Ljava/util/concurrent/ScheduledExecutorService;

.field private final baQ:Lcom/google/android/gms/internal/zzait;

.field private final baR:Lcom/google/android/gms/internal/zzalx;

.field private final baS:Z

.field private final baT:Ljava/lang/String;

.field private final baU:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzalx;Lcom/google/android/gms/internal/zzait;Ljava/util/concurrent/ScheduledExecutorService;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaiu;->baR:Lcom/google/android/gms/internal/zzalx;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzaiu;->baQ:Lcom/google/android/gms/internal/zzait;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzaiu;->aZE:Ljava/util/concurrent/ScheduledExecutorService;

    iput-boolean p4, p0, Lcom/google/android/gms/internal/zzaiu;->baS:Z

    iput-object p5, p0, Lcom/google/android/gms/internal/zzaiu;->baT:Ljava/lang/String;

    iput-object p6, p0, Lcom/google/android/gms/internal/zzaiu;->baU:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public zzcsh()Lcom/google/android/gms/internal/zzalx;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiu;->baR:Lcom/google/android/gms/internal/zzalx;

    return-object v0
.end method

.method public zzcsi()Lcom/google/android/gms/internal/zzait;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiu;->baQ:Lcom/google/android/gms/internal/zzait;

    return-object v0
.end method

.method public zzcsj()Ljava/util/concurrent/ScheduledExecutorService;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiu;->aZE:Ljava/util/concurrent/ScheduledExecutorService;

    return-object v0
.end method

.method public zzcsk()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzaiu;->baS:Z

    return v0
.end method

.method public zzcsl()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiu;->baT:Ljava/lang/String;

    return-object v0
.end method

.method public zzux()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiu;->baU:Ljava/lang/String;

    return-object v0
.end method
