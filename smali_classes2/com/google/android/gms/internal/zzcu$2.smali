.class Lcom/google/android/gms/internal/zzcu$2;
.super Landroid/content/BroadcastReceiver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzcu;->zzie()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzaus:Lcom/google/android/gms/internal/zzcu;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzcu;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzcu$2;->zzaus:Lcom/google/android/gms/internal/zzcu;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzcu$2;->zzaus:Lcom/google/android/gms/internal/zzcu;

    const/4 v1, 0x3

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzcu;->zza(Lcom/google/android/gms/internal/zzcu;I)V

    return-void
.end method
