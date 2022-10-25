.class Lcom/google/android/gms/internal/zzalb$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzalb$zzb;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzalb;->zza(Lcom/google/android/gms/internal/zzalb$zzb;ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/internal/zzalb$zzb",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final synthetic bhh:Lcom/google/android/gms/internal/zzalb$zzb;

.field final synthetic bhi:Z

.field final synthetic bhj:Lcom/google/android/gms/internal/zzalb;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzalb;Lcom/google/android/gms/internal/zzalb$zzb;Z)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzalb$1;->bhj:Lcom/google/android/gms/internal/zzalb;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzalb$1;->bhh:Lcom/google/android/gms/internal/zzalb$zzb;

    iput-boolean p3, p0, Lcom/google/android/gms/internal/zzalb$1;->bhi:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzd(Lcom/google/android/gms/internal/zzalb;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzalb",
            "<TT;>;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalb$1;->bhh:Lcom/google/android/gms/internal/zzalb$zzb;

    const/4 v1, 0x1

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzalb$1;->bhi:Z

    invoke-virtual {p1, v0, v1, v2}, Lcom/google/android/gms/internal/zzalb;->zza(Lcom/google/android/gms/internal/zzalb$zzb;ZZ)V

    return-void
.end method
