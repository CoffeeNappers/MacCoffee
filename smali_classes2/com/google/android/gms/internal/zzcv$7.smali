.class Lcom/google/android/gms/internal/zzcv$7;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzcv$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzcv;->onActivityDestroyed(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic zzavh:Lcom/google/android/gms/internal/zzcv;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzcv;Landroid/app/Activity;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzcv$7;->zzavh:Lcom/google/android/gms/internal/zzcv;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzcv$7;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Landroid/app/Application$ActivityLifecycleCallbacks;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzcv$7;->val$activity:Landroid/app/Activity;

    invoke-interface {p1, v0}, Landroid/app/Application$ActivityLifecycleCallbacks;->onActivityDestroyed(Landroid/app/Activity;)V

    return-void
.end method
