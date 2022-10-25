.class public Lcom/google/android/gms/ads/internal/overlay/zzaa;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/media/AudioManager$OnAudioFocusChangeListener;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xe
.end annotation

.annotation runtime Lcom/google/android/gms/internal/zzji;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/ads/internal/overlay/zzaa$zza;
    }
.end annotation


# instance fields
.field private final mAudioManager:Landroid/media/AudioManager;

.field private zzccd:Z

.field private final zzceq:Lcom/google/android/gms/ads/internal/overlay/zzaa$zza;

.field private zzcer:Z

.field private zzces:Z

.field private zzcet:F


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/overlay/zzaa$zza;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzaa;->zzcet:F

    const-string/jumbo v0, "audio"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzaa;->mAudioManager:Landroid/media/AudioManager;

    iput-object p2, p0, Lcom/google/android/gms/ads/internal/overlay/zzaa;->zzceq:Lcom/google/android/gms/ads/internal/overlay/zzaa$zza;

    return-void
.end method

.method private zzri()V
    .locals 2

    iget-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzaa;->zzccd:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzaa;->zzces:Z

    if-nez v0, :cond_1

    iget v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzaa;->zzcet:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    if-eqz v0, :cond_2

    iget-boolean v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzaa;->zzcer:Z

    if-nez v1, :cond_2

    invoke-direct {p0}, Lcom/google/android/gms/ads/internal/overlay/zzaa;->zzrj()V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzaa;->zzceq:Lcom/google/android/gms/ads/internal/overlay/zzaa$zza;

    invoke-interface {v0}, Lcom/google/android/gms/ads/internal/overlay/zzaa$zza;->zzpk()V

    :cond_0
    :goto_1
    return-void

    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    :cond_2
    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzaa;->zzcer:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/google/android/gms/ads/internal/overlay/zzaa;->zzrk()V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzaa;->zzceq:Lcom/google/android/gms/ads/internal/overlay/zzaa$zza;

    invoke-interface {v0}, Lcom/google/android/gms/ads/internal/overlay/zzaa$zza;->zzpk()V

    goto :goto_1
.end method

.method private zzrj()V
    .locals 4

    const/4 v0, 0x1

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzaa;->mAudioManager:Landroid/media/AudioManager;

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzaa;->zzcer:Z

    if-eqz v1, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzaa;->mAudioManager:Landroid/media/AudioManager;

    const/4 v2, 0x3

    const/4 v3, 0x2

    invoke-virtual {v1, p0, v2, v3}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I

    move-result v1

    if-ne v1, v0, :cond_2

    :goto_1
    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzaa;->zzcer:Z

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private zzrk()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzaa;->mAudioManager:Landroid/media/AudioManager;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzaa;->zzcer:Z

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzaa;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v0, p0}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    move-result v0

    if-nez v0, :cond_2

    const/4 v0, 0x1

    :goto_1
    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzaa;->zzcer:Z

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    goto :goto_1
.end method


# virtual methods
.method public onAudioFocusChange(I)V
    .locals 1

    if-lez p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzaa;->zzcer:Z

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzaa;->zzceq:Lcom/google/android/gms/ads/internal/overlay/zzaa$zza;

    invoke-interface {v0}, Lcom/google/android/gms/ads/internal/overlay/zzaa$zza;->zzpk()V

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setMuted(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/google/android/gms/ads/internal/overlay/zzaa;->zzces:Z

    invoke-direct {p0}, Lcom/google/android/gms/ads/internal/overlay/zzaa;->zzri()V

    return-void
.end method

.method public zzb(F)V
    .locals 0

    iput p1, p0, Lcom/google/android/gms/ads/internal/overlay/zzaa;->zzcet:F

    invoke-direct {p0}, Lcom/google/android/gms/ads/internal/overlay/zzaa;->zzri()V

    return-void
.end method

.method public zzre()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzaa;->zzccd:Z

    invoke-direct {p0}, Lcom/google/android/gms/ads/internal/overlay/zzaa;->zzri()V

    return-void
.end method

.method public zzrf()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzaa;->zzccd:Z

    invoke-direct {p0}, Lcom/google/android/gms/ads/internal/overlay/zzaa;->zzri()V

    return-void
.end method

.method public zzrh()F
    .locals 3

    const/4 v1, 0x0

    iget-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzaa;->zzces:Z

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    iget-boolean v2, p0, Lcom/google/android/gms/ads/internal/overlay/zzaa;->zzcer:Z

    if-eqz v2, :cond_1

    :goto_1
    return v0

    :cond_0
    iget v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzaa;->zzcet:F

    goto :goto_0

    :cond_1
    move v0, v1

    goto :goto_1
.end method
