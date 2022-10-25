.class public final Lcom/google/android/gms/internal/zzlp;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzji;
.end annotation


# instance fields
.field private final mView:Landroid/view/View;

.field private zzcxl:Landroid/app/Activity;

.field private zzcxm:Z

.field private zzcxn:Z

.field private zzcxo:Z

.field private zzcxp:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field private zzcxq:Landroid/view/ViewTreeObserver$OnScrollChangedListener;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Landroid/view/View;Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzlp;->zzcxl:Landroid/app/Activity;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzlp;->mView:Landroid/view/View;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzlp;->zzcxp:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzlp;->zzcxq:Landroid/view/ViewTreeObserver$OnScrollChangedListener;

    return-void
.end method

.method private zzwn()V
    .locals 3

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzlp;->zzcxm:Z

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzlp;->zzcxp:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzlp;->zzcxl:Landroid/app/Activity;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgm()Lcom/google/android/gms/internal/zzlb;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzlp;->zzcxl:Landroid/app/Activity;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzlp;->zzcxp:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzlb;->zza(Landroid/app/Activity;Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_0
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzhk()Lcom/google/android/gms/internal/zzly;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzlp;->mView:Landroid/view/View;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzlp;->zzcxp:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzly;->zza(Landroid/view/View;Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzlp;->zzcxq:Landroid/view/ViewTreeObserver$OnScrollChangedListener;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzlp;->zzcxl:Landroid/app/Activity;

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgm()Lcom/google/android/gms/internal/zzlb;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzlp;->zzcxl:Landroid/app/Activity;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzlp;->zzcxq:Landroid/view/ViewTreeObserver$OnScrollChangedListener;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzlb;->zza(Landroid/app/Activity;Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V

    :cond_2
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzhk()Lcom/google/android/gms/internal/zzly;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzlp;->mView:Landroid/view/View;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzlp;->zzcxq:Landroid/view/ViewTreeObserver$OnScrollChangedListener;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzly;->zza(Landroid/view/View;Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V

    :cond_3
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzlp;->zzcxm:Z

    :cond_4
    return-void
.end method

.method private zzwo()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzlp;->zzcxl:Landroid/app/Activity;

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzlp;->zzcxm:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzlp;->zzcxp:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzlp;->zzcxl:Landroid/app/Activity;

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgo()Lcom/google/android/gms/internal/zzlc;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzlp;->zzcxl:Landroid/app/Activity;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzlp;->zzcxp:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzlc;->zzb(Landroid/app/Activity;Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzlp;->zzcxq:Landroid/view/ViewTreeObserver$OnScrollChangedListener;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzlp;->zzcxl:Landroid/app/Activity;

    if-eqz v0, :cond_3

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgm()Lcom/google/android/gms/internal/zzlb;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzlp;->zzcxl:Landroid/app/Activity;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzlp;->zzcxq:Landroid/view/ViewTreeObserver$OnScrollChangedListener;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzlb;->zzb(Landroid/app/Activity;Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V

    :cond_3
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzlp;->zzcxm:Z

    goto :goto_0
.end method


# virtual methods
.method public onAttachedToWindow()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzlp;->zzcxn:Z

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzlp;->zzcxo:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzlp;->zzwn()V

    :cond_0
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzlp;->zzcxn:Z

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzlp;->zzwo()V

    return-void
.end method

.method public zzl(Landroid/app/Activity;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzlp;->zzcxl:Landroid/app/Activity;

    return-void
.end method

.method public zzwl()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzlp;->zzcxo:Z

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzlp;->zzcxn:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzlp;->zzwn()V

    :cond_0
    return-void
.end method

.method public zzwm()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzlp;->zzcxo:Z

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzlp;->zzwo()V

    return-void
.end method
