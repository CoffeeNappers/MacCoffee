.class public Lcom/google/android/gms/internal/zzalo$zza;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzalo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "zza"
.end annotation


# instance fields
.field public final bhT:Lcom/google/android/gms/internal/zzaln;

.field public final bhX:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzalf;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzaln;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzaln;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzalf;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzalo$zza;->bhT:Lcom/google/android/gms/internal/zzaln;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzalo$zza;->bhX:Ljava/util/List;

    return-void
.end method
