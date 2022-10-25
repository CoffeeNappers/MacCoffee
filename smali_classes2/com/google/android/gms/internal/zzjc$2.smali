.class Lcom/google/android/gms/internal/zzjc$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzfe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzjc;->zzj(Lcom/google/android/gms/internal/zzmd;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzciv:Lcom/google/android/gms/internal/zzjc;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzjc;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzjc$2;->zzciv:Lcom/google/android/gms/internal/zzjc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzmd;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzmd;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzjc$2;->zzciv:Lcom/google/android/gms/internal/zzjc;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzjc;->zza(Lcom/google/android/gms/internal/zzjc;)Lcom/google/android/gms/ads/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzq;->zzfu()V

    return-void
.end method
