.class public final Lcom/google/android/gms/internal/zzdk;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzji;
.end annotation


# instance fields
.field private zzbcl:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzdr;->zzbcx:Lcom/google/android/gms/internal/zzdn;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzdn;->zzlp()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzdk;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/google/android/gms/internal/zzdr;->zzbcx:Lcom/google/android/gms/internal/zzdn;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzdn;->zzlp()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :goto_0
    iput-object v0, p0, Lcom/google/android/gms/internal/zzdk;->zzbcl:Ljava/lang/String;

    return-void

    :cond_0
    move-object v0, p1

    goto :goto_0
.end method


# virtual methods
.method public zzlo()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdk;->zzbcl:Ljava/lang/String;

    return-object v0
.end method
