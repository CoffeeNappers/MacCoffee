.class Lcom/google/android/gms/internal/zzli$zzc;
.super Lcom/google/android/gms/internal/zzlq;

# interfaces
.implements Lcom/google/android/gms/internal/zzm$zzb;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzli;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "zzc"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/android/gms/internal/zzlq",
        "<TT;>;",
        "Lcom/google/android/gms/internal/zzm$zzb",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final synthetic zzcww:Lcom/google/android/gms/internal/zzli;


# direct methods
.method private constructor <init>(Lcom/google/android/gms/internal/zzli;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzli$zzc;->zzcww:Lcom/google/android/gms/internal/zzli;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzlq;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/internal/zzli;Lcom/google/android/gms/internal/zzli$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzli$zzc;-><init>(Lcom/google/android/gms/internal/zzli;)V

    return-void
.end method


# virtual methods
.method public zzb(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    invoke-super {p0, p1}, Lcom/google/android/gms/internal/zzlq;->zzh(Ljava/lang/Object;)V

    return-void
.end method
