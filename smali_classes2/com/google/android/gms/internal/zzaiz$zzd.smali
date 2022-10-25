.class Lcom/google/android/gms/internal/zzaiz$zzd;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzaiz;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "zzd"
.end annotation


# instance fields
.field private final bbJ:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final bbL:Ljava/lang/String;

.field private final bbM:Lcom/google/android/gms/internal/zzajb;

.field private final data:Ljava/lang/Object;


# direct methods
.method private constructor <init>(Ljava/lang/String;Ljava/util/List;Ljava/lang/Object;Lcom/google/android/gms/internal/zzajb;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Object;",
            "Lcom/google/android/gms/internal/zzajb;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaiz$zzd;->bbL:Ljava/lang/String;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzaiz$zzd;->bbJ:Ljava/util/List;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzaiz$zzd;->data:Ljava/lang/Object;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzaiz$zzd;->bbM:Lcom/google/android/gms/internal/zzajb;

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Ljava/util/List;Ljava/lang/Object;Lcom/google/android/gms/internal/zzajb;Lcom/google/android/gms/internal/zzaiz$1;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/gms/internal/zzaiz$zzd;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/lang/Object;Lcom/google/android/gms/internal/zzajb;)V

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzaiz$zzd;)Lcom/google/android/gms/internal/zzajb;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz$zzd;->bbM:Lcom/google/android/gms/internal/zzajb;

    return-object v0
.end method


# virtual methods
.method public getAction()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz$zzd;->bbL:Ljava/lang/String;

    return-object v0
.end method

.method public getData()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz$zzd;->data:Ljava/lang/Object;

    return-object v0
.end method

.method public zzcte()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz$zzd;->bbJ:Ljava/util/List;

    return-object v0
.end method

.method public zzctf()Lcom/google/android/gms/internal/zzajb;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz$zzd;->bbM:Lcom/google/android/gms/internal/zzajb;

    return-object v0
.end method
