//
//  ListDatasource.swift
//  ViperListDetail
//
//  Created by Pavel Yeshchyk on 3/15/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class ListDatasource: NSObject, ListDatasourceProtocol, NSFetchedResultsControllerDelegate {


    let fetchResultController:NSFetchedResultsController
    var listener:ListDatasourceListenerProtocol?
    
    deinit {
        
        self.fetchResultController.delegate = nil
    }
    
    override init() {
        
        let context = CoreDataProvider.sharedInstance().mainManagedObjectContext
        let request = NSFetchRequest(entityName: "DetailEntity")
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]

        self.fetchResultController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil);
        
        
        super.init()
        
        self.fetchResultController.delegate = self

    }
    
    func reload() {
        
        do {
            
            try self.fetchResultController.performFetch()
            
            guard let listener = self.listener else {

                return
            }
            
            listener.hasUpdatedData()
            
        } catch {
            
        }
        
    }
    
    func numberOfItems() -> Int {
        
        guard let fetchedObjects = self.fetchResultController.fetchedObjects else {
            
            return 0
        }
        
        return fetchedObjects.count
    }
    
    func itemAtIndex(index:Int) throws -> DetailEntity {

        guard let fetchedObjects = self.fetchResultController.fetchedObjects where fetchedObjects.count > 0 else {
            
            throw FetchError.FetchedObjectNotFound
        }
        
        guard let fetchedObject:DetailEntity = fetchedObjects[index] as? DetailEntity else {
            
            throw FetchError.FetchedObjectHasWrongType
        }
        
        return fetchedObject
    }

    
    func createNewObject(callback: ListDatasourceCreateNewObjectCallback) {
        
        let context = CoreDataProvider.sharedInstance().mainManagedObjectContext

        context.performBlock { () -> Void in
            
            let object = DetailEntity.insertNewObjectInManagedObjectContext(context)
            callback(obj: object)

            if (context.hasChanges) {
                do {
                    
                    try context.save()
                }catch {
                    
                }
            }
            guard let listener = self.listener else {
                
                return
            }
            
            listener.hasUpdatedData()
        }
    }
    

    func saveObjectByDetailId(detailId:AnyObject, callback:ListDatasourceSaveObjectCallback) {
        
        
        let context = CoreDataProvider.sharedInstance().mainManagedObjectContext
        
        context.performBlock { () -> Void in
            
            let predicate = NSPredicate(format: "ident == %@", argumentArray: [detailId])
            let context = CoreDataProvider.sharedInstance().mainManagedObjectContext
            guard let object = DetailEntity.singleObjectWithPredicate(predicate, inManagedObjectContext: context, includingSubentities: false) as DetailEntity? else {

                return
            }
            callback(obj: object)
            
            if (context.hasChanges) {
                do {
                    
                    try context.save()
                }catch {
                    
                }
            }
            guard let listener = self.listener else {
                
                return
            }
            
            listener.hasUpdatedData()
        }
        
        
        
//        let predicate = NSPredicate(format: "ident == %@", argumentArray: [detailId])
//        let context = CoreDataProvider.sharedInstance().mainManagedObjectContext
//        guard let detail = DetailEntity.singleObjectWithPredicate(predicate, inManagedObjectContext: context, includingSubentities: false) as DetailEntity? else {
//            
//            return
//        }
//        
//        let result = ListMapping.listEntityFromDetailEntity(detail)
//        callback(obj: result)
        
    }
    
    
    func findObjectByDetailId(detailId:AnyObject, callback:ListDataSourceFindObjectCallback) {

        let predicate = NSPredicate(format: "ident == %@", argumentArray: [detailId])
        let context = CoreDataProvider.sharedInstance().mainManagedObjectContext
        guard let detail = DetailEntity.singleObjectWithPredicate(predicate, inManagedObjectContext: context, includingSubentities: false) as DetailEntity? else {
            
            return
        }
        
        let result = ListMapping.listEntityFromDetailEntity(detail)
        callback(obj: result)
    }
    
    
    //MARK: - NSFetchedResultsControllerDelegate
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        
        guard let listener = self.listener else {
            
            return
        }
        listener.hasUpdatedData()
    }
}
