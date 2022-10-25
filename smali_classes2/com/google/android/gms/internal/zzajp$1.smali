.class Lcom/google/android/gms/internal/zzajp$1;
.super Lcom/google/android/gms/internal/zzanh;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzajp;->zzb(Lcom/google/android/gms/internal/zzajj;)Lcom/google/android/gms/internal/zzajv;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic aZL:Lcom/google/android/gms/internal/zzalw;

.field final synthetic bdE:Lcom/google/android/gms/internal/zzajp;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzajp;Lcom/google/android/gms/internal/zzalw;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzajp$1;->bdE:Lcom/google/android/gms/internal/zzajp;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzajp$1;->aZL:Lcom/google/android/gms/internal/zzalw;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzanh;-><init>()V

    return-void
.end method


# virtual methods
.method public zzj(Ljava/lang/Throwable;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajp$1;->aZL:Lcom/google/android/gms/internal/zzalw;

    invoke-static {p1}, Lcom/google/android/gms/internal/zzanh;->zzl(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/google/android/gms/internal/zzalw;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
