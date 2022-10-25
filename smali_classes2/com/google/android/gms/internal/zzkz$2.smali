.class final Lcom/google/android/gms/internal/zzkz$2;
.super Lcom/google/android/gms/internal/zzkz$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzkz;->zzg(Landroid/content/Context;Ljava/lang/String;)Ljava/util/concurrent/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzang:Landroid/content/Context;

.field final synthetic zzcuv:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    iput-object p1, p0, Lcom/google/android/gms/internal/zzkz$2;->zzang:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzkz$2;->zzcuv:Ljava/lang/String;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzkz$zza;-><init>(Lcom/google/android/gms/internal/zzkz$1;)V

    return-void
.end method


# virtual methods
.method public zzfp()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkz$2;->zzang:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzkz;->zzm(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "content_vertical_hashes"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzkz$2;->zzcuv:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method
