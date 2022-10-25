.class Lcom/google/android/gms/measurement/internal/zzr$zzb;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation build Landroid/support/annotation/WorkerThread;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/measurement/internal/zzr;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "zzb"
.end annotation


# instance fields
.field private final asO:Lcom/google/android/gms/measurement/internal/zzr$zza;

.field private final asP:[B

.field private final asQ:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private final zzbtt:I

.field private final zzcjc:Ljava/lang/String;

.field private final zzcye:Ljava/lang/Throwable;


# direct methods
.method private constructor <init>(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzr$zza;ILjava/lang/Throwable;[BLjava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/measurement/internal/zzr$zza;",
            "I",
            "Ljava/lang/Throwable;",
            "[B",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p2}, Lcom/google/android/gms/common/internal/zzaa;->zzy(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzr$zzb;->asO:Lcom/google/android/gms/measurement/internal/zzr$zza;

    iput p3, p0, Lcom/google/android/gms/measurement/internal/zzr$zzb;->zzbtt:I

    iput-object p4, p0, Lcom/google/android/gms/measurement/internal/zzr$zzb;->zzcye:Ljava/lang/Throwable;

    iput-object p5, p0, Lcom/google/android/gms/measurement/internal/zzr$zzb;->asP:[B

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzr$zzb;->zzcjc:Ljava/lang/String;

    iput-object p6, p0, Lcom/google/android/gms/measurement/internal/zzr$zzb;->asQ:Ljava/util/Map;

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzr$zza;ILjava/lang/Throwable;[BLjava/util/Map;Lcom/google/android/gms/measurement/internal/zzr$1;)V
    .locals 0

    invoke-direct/range {p0 .. p6}, Lcom/google/android/gms/measurement/internal/zzr$zzb;-><init>(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzr$zza;ILjava/lang/Throwable;[BLjava/util/Map;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzr$zzb;->asO:Lcom/google/android/gms/measurement/internal/zzr$zza;

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzr$zzb;->zzcjc:Ljava/lang/String;

    iget v2, p0, Lcom/google/android/gms/measurement/internal/zzr$zzb;->zzbtt:I

    iget-object v3, p0, Lcom/google/android/gms/measurement/internal/zzr$zzb;->zzcye:Ljava/lang/Throwable;

    iget-object v4, p0, Lcom/google/android/gms/measurement/internal/zzr$zzb;->asP:[B

    iget-object v5, p0, Lcom/google/android/gms/measurement/internal/zzr$zzb;->asQ:Ljava/util/Map;

    invoke-interface/range {v0 .. v5}, Lcom/google/android/gms/measurement/internal/zzr$zza;->zza(Ljava/lang/String;ILjava/lang/Throwable;[BLjava/util/Map;)V

    return-void
.end method
