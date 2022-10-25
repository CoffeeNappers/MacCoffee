.class Lcom/google/android/gms/internal/zzkq$zza;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzkq;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "zza"
.end annotation


# instance fields
.field private final zzctm:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final zzctn:Landroid/os/Bundle;

.field final synthetic zzcto:Lcom/google/android/gms/internal/zzkq;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzkq;Ljava/util/List;Landroid/os/Bundle;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/os/Bundle;",
            ")V"
        }
    .end annotation

    iput-object p1, p0, Lcom/google/android/gms/internal/zzkq$zza;->zzcto:Lcom/google/android/gms/internal/zzkq;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/google/android/gms/internal/zzkq$zza;->zzctm:Ljava/util/List;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzkq$zza;->zzctn:Landroid/os/Bundle;

    return-void
.end method
