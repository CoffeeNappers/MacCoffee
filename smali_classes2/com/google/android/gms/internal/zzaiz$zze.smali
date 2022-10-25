.class Lcom/google/android/gms/internal/zzaiz$zze;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzaiz;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "zze"
.end annotation


# instance fields
.field private final bbN:Lcom/google/android/gms/internal/zzajb;

.field private final bbO:Lcom/google/android/gms/internal/zzaiz$zzc;

.field private final bbP:Lcom/google/android/gms/internal/zzaix;

.field private final bbQ:Ljava/lang/Long;


# direct methods
.method private constructor <init>(Lcom/google/android/gms/internal/zzajb;Lcom/google/android/gms/internal/zzaiz$zzc;Ljava/lang/Long;Lcom/google/android/gms/internal/zzaix;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaiz$zze;->bbN:Lcom/google/android/gms/internal/zzajb;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzaiz$zze;->bbO:Lcom/google/android/gms/internal/zzaiz$zzc;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzaiz$zze;->bbP:Lcom/google/android/gms/internal/zzaix;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzaiz$zze;->bbQ:Ljava/lang/Long;

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/internal/zzajb;Lcom/google/android/gms/internal/zzaiz$zzc;Ljava/lang/Long;Lcom/google/android/gms/internal/zzaix;Lcom/google/android/gms/internal/zzaiz$1;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/gms/internal/zzaiz$zze;-><init>(Lcom/google/android/gms/internal/zzajb;Lcom/google/android/gms/internal/zzaiz$zzc;Ljava/lang/Long;Lcom/google/android/gms/internal/zzaix;)V

    return-void
.end method

.method static synthetic zzc(Lcom/google/android/gms/internal/zzaiz$zze;)Lcom/google/android/gms/internal/zzaiz$zzc;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz$zze;->bbO:Lcom/google/android/gms/internal/zzaiz$zzc;

    return-object v0
.end method

.method static synthetic zzd(Lcom/google/android/gms/internal/zzaiz$zze;)Lcom/google/android/gms/internal/zzajb;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz$zze;->bbN:Lcom/google/android/gms/internal/zzajb;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 5

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz$zze;->bbO:Lcom/google/android/gms/internal/zzaiz$zzc;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaiz$zzc;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaiz$zze;->bbQ:Ljava/lang/Long;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x8

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v3, v4

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, " (Tag: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public zzctg()Lcom/google/android/gms/internal/zzaiz$zzc;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz$zze;->bbO:Lcom/google/android/gms/internal/zzaiz$zzc;

    return-object v0
.end method

.method public zzcth()Ljava/lang/Long;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz$zze;->bbQ:Ljava/lang/Long;

    return-object v0
.end method

.method public zzcti()Lcom/google/android/gms/internal/zzaix;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz$zze;->bbP:Lcom/google/android/gms/internal/zzaix;

    return-object v0
.end method
