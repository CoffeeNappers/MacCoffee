.class Lcom/google/android/gms/internal/zzcr$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzfe;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzcr;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzauf:Lcom/google/android/gms/internal/zzcr;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzcr;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzcr$1;->zzauf:Lcom/google/android/gms/internal/zzcr;

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

    iget-object v0, p0, Lcom/google/android/gms/internal/zzcr$1;->zzauf:Lcom/google/android/gms/internal/zzcr;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzcr;->zza(Lcom/google/android/gms/internal/zzcr;)Lcom/google/android/gms/internal/zzcp;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/internal/zzcp;->zzb(Lcom/google/android/gms/internal/zzmd;Ljava/util/Map;)V

    return-void
.end method
