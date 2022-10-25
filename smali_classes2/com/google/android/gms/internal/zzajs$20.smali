.class Lcom/google/android/gms/internal/zzajs$20;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzajs;->zza(Lcom/google/firebase/database/DatabaseReference$CompletionListener;Lcom/google/firebase/database/DatabaseError;Lcom/google/android/gms/internal/zzajq;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic bdZ:Lcom/google/android/gms/internal/zzajs;

.field final synthetic bec:Lcom/google/firebase/database/DatabaseReference$CompletionListener;

.field final synthetic bev:Lcom/google/firebase/database/DatabaseError;

.field final synthetic bew:Lcom/google/firebase/database/DatabaseReference;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/firebase/database/DatabaseReference$CompletionListener;Lcom/google/firebase/database/DatabaseError;Lcom/google/firebase/database/DatabaseReference;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzajs$20;->bdZ:Lcom/google/android/gms/internal/zzajs;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzajs$20;->bec:Lcom/google/firebase/database/DatabaseReference$CompletionListener;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzajs$20;->bev:Lcom/google/firebase/database/DatabaseError;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzajs$20;->bew:Lcom/google/firebase/database/DatabaseReference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs$20;->bec:Lcom/google/firebase/database/DatabaseReference$CompletionListener;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs$20;->bev:Lcom/google/firebase/database/DatabaseError;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzajs$20;->bew:Lcom/google/firebase/database/DatabaseReference;

    invoke-interface {v0, v1, v2}, Lcom/google/firebase/database/DatabaseReference$CompletionListener;->onComplete(Lcom/google/firebase/database/DatabaseError;Lcom/google/firebase/database/DatabaseReference;)V

    return-void
.end method
