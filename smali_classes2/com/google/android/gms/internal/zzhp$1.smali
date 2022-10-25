.class Lcom/google/android/gms/internal/zzhp$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzhp;->execute()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzbyc:Lcom/google/android/gms/internal/zzhp;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzhp;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzhp$1;->zzbyc:Lcom/google/android/gms/internal/zzhp;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhp$1;->zzbyc:Lcom/google/android/gms/internal/zzhp;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhp;->createIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgm()Lcom/google/android/gms/internal/zzlb;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzhp$1;->zzbyc:Lcom/google/android/gms/internal/zzhp;

    invoke-static {v2}, Lcom/google/android/gms/internal/zzhp;->zza(Lcom/google/android/gms/internal/zzhp;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/internal/zzlb;->zzb(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method
