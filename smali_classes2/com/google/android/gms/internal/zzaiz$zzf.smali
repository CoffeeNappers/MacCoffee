.class Lcom/google/android/gms/internal/zzaiz$zzf;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzaiz;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "zzf"
.end annotation


# instance fields
.field private bbL:Ljava/lang/String;

.field private bbM:Lcom/google/android/gms/internal/zzajb;

.field private bbR:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private bbS:Z


# direct methods
.method private constructor <init>(Ljava/lang/String;Ljava/util/Map;Lcom/google/android/gms/internal/zzajb;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/google/android/gms/internal/zzajb;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaiz$zzf;->bbL:Ljava/lang/String;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzaiz$zzf;->bbR:Ljava/util/Map;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzaiz$zzf;->bbM:Lcom/google/android/gms/internal/zzajb;

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Ljava/util/Map;Lcom/google/android/gms/internal/zzajb;Lcom/google/android/gms/internal/zzaiz$1;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gms/internal/zzaiz$zzf;-><init>(Ljava/lang/String;Ljava/util/Map;Lcom/google/android/gms/internal/zzajb;)V

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzaiz$zzf;)Lcom/google/android/gms/internal/zzajb;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz$zzf;->bbM:Lcom/google/android/gms/internal/zzajb;

    return-object v0
.end method


# virtual methods
.method public getAction()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz$zzf;->bbL:Ljava/lang/String;

    return-object v0
.end method

.method public zzctf()Lcom/google/android/gms/internal/zzajb;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz$zzf;->bbM:Lcom/google/android/gms/internal/zzajb;

    return-object v0
.end method

.method public zzctj()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz$zzf;->bbR:Ljava/util/Map;

    return-object v0
.end method

.method public zzctk()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzaiz$zzf;->bbS:Z

    return-void
.end method

.method public zzctl()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzaiz$zzf;->bbS:Z

    return v0
.end method
